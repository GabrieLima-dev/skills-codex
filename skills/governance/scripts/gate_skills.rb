#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'lib/skill_quality'

base = 'skills'
min_score = 95

argv = ARGV.dup
until argv.empty?
  flag = argv.shift
  case flag
  when '--base'
    base = argv.shift
  when '--min-score'
    min_score = Integer(argv.shift)
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

failures = []
required_keywords_by_skill = {
  'project-readiness-gate' => /(backend).*(frontend).*(docs).*(bloquead|aprovado para execu[çc][ãa]o)|(bloquead|aprovado para execu[çc][ãa]o).*(backend).*(frontend).*(docs)/im,
  'sdd-sprint-orquestracao' => /(TDD|red\s*->\s*green\s*->\s*refactor).*(como testar)|como testar.*(TDD|red\s*->\s*green\s*->\s*refactor)/im,
  'sdd-spec-code' => /(TDD|red\s*->\s*green\s*->\s*refactor)/i,
  'sdd-validacao' => /(evid[êe]ncia.*TDD|TDD).*(como testar)|como testar.*(evid[êe]ncia.*TDD|TDD)/im,
  'github-flow' => /(plano.*aprovad).*(como testar)|como testar.*(plano.*aprovad)/im
}

results.each do |r|
  if r[:total_score] < min_score
    failures << "#{r[:name]}: score #{r[:total_score]} abaixo do mínimo #{min_score}"
  end

  missing = r[:structural_checks].select { |_k, ok| !ok }.keys
  unless missing.empty?
    failures << "#{r[:name]}: seções/controles ausentes -> #{missing.join(', ')}"
  end

  if r[:references_score] < 80
    failures << "#{r[:name]}: referências insuficientes (#{r[:references_score]}/100)"
  end

  keyword_pattern = required_keywords_by_skill[r[:name]]
  next unless keyword_pattern

  skill_text = File.read(r[:path])
  unless skill_text.match?(keyword_pattern)
    failures << "#{r[:name]}: ausência de palavras-chave obrigatórias (plano/TDD/como testar)"
  end
end

agents_path = File.expand_path('../AGENTS.md', base)
if File.exist?(agents_path)
  agents_text = File.read(agents_path)
  required_agents_patterns = [
    /Skills docs pack sync rule/i,
    /Mandatory stack triad rule/i,
    /Universal plan gate rule/i,
    /Universal SDD rule/i,
    /TDD mandatory rule/i,
    /How-to-test mandatory rule/i,
    /Publish blocking rule/i
  ]

  unless required_agents_patterns.all? { |pattern| agents_text.match?(pattern) }
    failures << "AGENTS.md: regras universais obrigatórias ausentes (plano/SDD/TDD/como testar/publicação/docs pack)"
  end
end

if failures.empty?
  puts "GATE_OK base=#{base} min_score=#{min_score} skills=#{results.size}"
  exit 0
end

puts "GATE_FAILED"
failures.each { |f| puts "- #{f}" }
exit 1
