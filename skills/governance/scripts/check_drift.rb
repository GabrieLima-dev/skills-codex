#!/usr/bin/env ruby
# frozen_string_literal: true

root_base = 'skills'
front_base = ENV['SKILLS_FRONT_BASE']
back_base = ENV['SKILLS_BACK_BASE']
front_agents = ENV['SKILLS_FRONT_AGENTS']
back_agents = ENV['SKILLS_BACK_AGENTS']

required_shared_skills = %w[
  project-readiness-gate
  context
  data-model
  front-ux-ui-design
  github-flow
  code-review
  api-doc-postman
  vps-easypanel
  sdd-sprint-orquestracao
  aprendizado-profundo
  sdd-pesquisa-prd
  sdd-prd-spec
  sdd-spec-code
  sdd-validacao
]

argv = ARGV.dup
until argv.empty?
  flag = argv.shift
  case flag
  when '--root-base'
    root_base = argv.shift
  when '--front-base'
    front_base = argv.shift
  when '--back-base'
    back_base = argv.shift
  when '--front-agents'
    front_agents = argv.shift
  when '--back-agents'
    back_agents = argv.shift
  else
    warn "Flag não suportada: #{flag}"
    exit 2
  end
end

unless Dir.exist?(root_base)
  warn "Diretório não encontrado: #{root_base}"
  exit 1
end

failures = []

required_shared_skills.each do |name|
  root_dir = File.join(root_base, name)
  root_skill = File.join(root_dir, 'SKILL.md')

  failures << "#{name}: skill ausente em #{root_dir}" unless Dir.exist?(root_dir)
  failures << "#{name}: arquivo ausente #{root_skill}" unless File.exist?(root_skill)

  root_refs = Dir.glob(File.join(root_dir, 'references', '*.md')).sort
  if root_refs.empty?
    failures << "#{name}: references ausente/vazio na raiz"
  else
    root_refs.each do |ref_path|
      failures << "#{name}: reference vazia #{ref_path}" if File.read(ref_path).strip.empty?
    end
  end
end

if front_base && !front_base.strip.empty?
  failures << "Front não deve conter skills locais: #{front_base}" if Dir.exist?(front_base)
end
if back_base && !back_base.strip.empty?
  failures << "Back não deve conter skills locais: #{back_base}" if Dir.exist?(back_base)
end
if front_agents && !front_agents.strip.empty?
  failures << "Front não deve conter AGENTS.md local: #{front_agents}" if File.exist?(front_agents)
end
if back_agents && !back_agents.strip.empty?
  failures << "Back não deve conter AGENTS.md local: #{back_agents}" if File.exist?(back_agents)
end

if failures.empty?
  puts "DRIFT_ROOT_ONLY_OK skills=#{required_shared_skills.size}"
  exit 0
end

puts 'DRIFT_FOUND'
failures.each { |f| puts "- #{f}" }
exit 1
