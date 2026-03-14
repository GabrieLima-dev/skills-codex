#!/usr/bin/env ruby
# frozen_string_literal: true

require 'time'
require_relative 'lib/skill_quality'

base = 'skills'
output = nil

argv = ARGV.dup
until argv.empty?
  flag = argv.shift
  case flag
  when '--base'
    base = argv.shift
  when '--output'
    output = argv.shift
  else
    warn "Flag não suportada: #{flag}"
    exit 2
  end
end

unless Dir.exist?(base)
  warn "Diretório base não encontrado: #{base}"
  exit 1
end

results = SkillGovernance::Quality.evaluate_base(base)
if results.empty?
  warn "Nenhuma skill encontrada em #{base}"
  exit 1
end

lines = []
lines << "# Métricas de Qualidade de Skills"
lines << ""
lines << "Data de geração: `#{Time.now.iso8601}`"
lines << "Base analisada: `#{base}`"
lines << ""
lines << "## Rubrica"
lines << ""
lines << "- Score estrutural: 10 critérios binários (10 pontos cada)."
lines << "- Score de referências: presença e qualidade mínima de `references/*.md`."
lines << "- Score final: `0.7 * estrutural + 0.3 * referências`."
lines << "- Status: A (>=90), B (80-89), C (70-79), D (<70)."
lines << ""
lines << "## Resultado consolidado"
lines << ""
lines << "| Skill | Estrutural | Referências | Final | Status |"
lines << "|---|---:|---:|---:|:---:|"
results.each do |r|
  lines << "| `#{r[:name]}` | #{r[:structural_score]} | #{r[:references_score]} | #{r[:total_score]} | #{r[:status]} |"
end
lines << ""
lines << "## Evidências"
lines << ""
results.each do |r|
  lines << "### #{r[:name]}"
  lines << ""
  lines << "- Estrutural: #{r[:structural_score]}/100"
  r[:structural_checks].each do |name, ok|
    lines << "- #{ok ? '[x]' : '[ ]'} #{name}"
  end
  lines << "- Referências: #{r[:references_score]}/100"
  r[:references_details].each do |detail|
    lines << "- #{detail}"
  end
  lines << ""
end

report = lines.join("\n")

if output
  File.write(output, report)
  puts "Relatório salvo em #{output}"
else
  puts report
end
