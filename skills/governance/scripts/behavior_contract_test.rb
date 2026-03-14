#!/usr/bin/env ruby
# frozen_string_literal: true

base = 'skills'

argv = ARGV.dup
until argv.empty?
  flag = argv.shift
  case flag
  when '--base'
    base = argv.shift
  else
    warn "Flag não suportada: #{flag}"
    exit 2
  end
end

skill_paths = Dir.glob(File.join(base, '*', 'SKILL.md')).sort
if skill_paths.empty?
  warn "Nenhuma skill encontrada em #{base}"
  exit 1
end

required_patterns = {
  'Fail-Safe section' => /##\s+Fail-Safe e Tratamento de Ambiguidade/i,
  'Contrato de Saída section' => /##\s+Contrato de Saída/i,
  'Guardrails section' => /##\s+Guardrails/i,
  'Checklist de Qualidade section' => /##\s+Checklist de Qualidade/i,
  'Tratamento de ambiguidade' => /ambig[uú]/i,
  'Tratamento de contexto incompleto' => /(faltar context|contexto.*incomplet|incomplet.*contexto|insuficient|limitaç|lacuna)/i,
  'Tratamento de conflito' => /conflit/i,
  'Controle de risco' => /risco/i
}

required_by_skill = {
  'project-readiness-gate' => {
    'Validação obrigatória de stack/configuração' => /(stack|configura[çc][ãa]o).*(obrigat[óo]ri|valid)/i,
    'Bloqueio sem contexto mínimo' => /(bloquead|n[aã]o.*execut).*(contexto|incomplet)/i,
    'Perguntas para preencher lacunas' => /(pergunt|campos ausentes|lacunas)/i,
    'Tríade obrigatória backend frontend docs' => /(backend).*(frontend).*(docs)|(docs).*(frontend).*(backend)|(frontend).*(backend).*(docs)/im
  },
  'sdd-sprint-orquestracao' => {
    'Plano aprovado explícito para execução' => /(plano.*aprovad|aprova[çc][ãa]o.*expl[íi]cit)/i,
    'Plano com riscos percebidos' => /(riscos?\s+percebidos|riscos?\s+t[ée]cnic)/i,
    'Plano com impacto esperado da alteração' => /(impacto\s+esperad[oa].*altera[çc][ãa]o|impacto\s+funcional\s+esperad)/i,
    'TDD obrigatório' => /(TDD|red\s*->\s*green\s*->\s*refactor)/i,
    'Seção como testar' => /como testar/i,
    'Comando explícito para execução' => /(comando.*expl[íi]cito.*execut|aguardar comando expl[íi]cito)/i,
    'Checkpoint de testes adicionais' => /(testes adicionais|checkpoint.*testes)/i,
    'Relatório estruturado de testes e métricas' => /(relat[óo]rio.*estruturado.*testes.*m[ée]tric|formato obrigat[óo]rio.*testes)/i,
    'Sync pacote doc skills' => /(doc_skills\/readme\.md).*(doc_skills\/skills-workflow-guide\.html)|(doc_skills\/skills-workflow-guide\.html).*(doc_skills\/readme\.md)/im
  },
  'sdd-spec-code' => {
    'TDD obrigatório' => /(TDD|red\s*->\s*green\s*->\s*refactor)/i,
    'Seção como testar' => /como testar/i
  },
  'sdd-validacao' => {
    'Evidência de TDD' => /(evid[êe]ncia.*TDD|TDD)/i,
    'Seção como testar' => /como testar/i,
    'Checkpoint de testes adicionais' => /(testes adicionais|checkpoint.*testes)/i,
    'Relatório estruturado de testes e métricas' => /(relat[óo]rio.*estruturado.*testes.*m[ée]tric|formato obrigat[óo]rio.*testes)/i
  },
  'github-flow' => {
    'Bloqueio sem plano aprovado' => /(bloquear publica[çc][ãa]o.*plano|plano.*aprovad)/i,
    'Bloqueio sem TDD' => /(bloquear publica[çc][ãa]o.*TDD|TDD)/i,
    'Exigência de como testar' => /como testar/i,
    'Política de branch de trabalho' => /(branch de trabalho|nova branch.*main)/i,
    'PR para main' => /(->\s*main|para\s+main)/i,
    'Sync pacote doc skills' => /(doc_skills\/readme\.md).*(doc_skills\/skills-workflow-guide\.html)|(doc_skills\/skills-workflow-guide\.html).*(doc_skills\/readme\.md)/im
  },
  'front-ux-ui-design' => {
    'Acionamento obrigatório para mudança frontend visual/layout/theme/responsividade/UX' => /(qualquer (mudan[çc]a|altera[çc][ãa]o).*frontend.*visual|layout.*theme.*responsividade|frontend.*visual\/layout\/theme\/responsividade\/UX)/i,
    'Exigência de 3 modelos de mercado com links' => /(3.*modelos.*mercado.*links?|exatamente\s*3.*refer[êe]ncias.*links?)/i,
    '3 modelos obrigatórios no plano antes da implementação' => /(plano.*3.*modelos.*links?|3.*modelos.*links.*plano)/i,
    'Aprovação explícita antes da implementação' => /(aprova[çc][ãa]o.*expl[íi]cit.*antes.*implement|confirmar explicitamente.*antes de editar)/i
  }
}

failures = []

skill_paths.each do |path|
  text = File.read(path)
  skill_name = File.basename(File.dirname(path))
  missing = required_patterns.select { |_name, pattern| text !~ pattern }.keys
  extra_missing = (required_by_skill[skill_name] || {}).select { |_name, pattern| text !~ pattern }.keys
  missing += extra_missing
  unless missing.empty?
    failures << "#{path}: #{missing.join('; ')}"
  end
end

agents_path = File.expand_path('../AGENTS.md', base)
if File.exist?(agents_path)
  agents_text = File.read(agents_path)
  required_agents_patterns = {
    'Project readiness gate rule' => /Project readiness gate rule/i,
    'Mandatory stack triad rule' => /Mandatory stack triad rule/i,
    'Skills docs pack sync rule' => /Skills docs pack sync rule/i,
    'Skills docs sync with readme and guide' => /Skills docs sync rule:.*doc_skills\/readme\.md.*doc_skills\/skills-workflow-guide\.html/i,
    'Universal plan gate rule' => /Universal plan gate rule/i,
    'Explicit command execution rule' => /Explicit command execution rule/i,
    'Execution authorization register rule' => /Execution authorization register rule/i,
    'Branch creation for publish rule' => /Branch creation for publish rule/i,
    'Frontend UX benchmark mandatory rule' => /Frontend UX benchmark mandatory rule/i,
    'Structured plan with risks and expected impact' => /Structured plan rule:.*riscos percebidos.*impacto esperado da altera[çc][ãa]o/i,
    'Frontend benchmark in plan with 3 proposals and links' => /Frontend UX benchmark mandatory rule:.*plano.*3.*propostas.*links/i,
    'Universal SDD rule' => /Universal SDD rule/i,
    'TDD mandatory rule' => /TDD mandatory rule/i,
    'Mandatory test report format rule' => /Mandatory test report format rule/i,
    'Pre-close extra-tests checkpoint rule' => /Pre-close extra-tests checkpoint rule/i,
    'How-to-test mandatory rule' => /How-to-test mandatory rule/i,
    'Publish blocking rule' => /Publish blocking rule/i
  }

  missing_agents = required_agents_patterns.select { |_name, pattern| agents_text !~ pattern }.keys
  unless missing_agents.empty?
    failures << "#{agents_path}: #{missing_agents.join('; ')}"
  end
end

if failures.empty?
  puts "BEHAVIOR_CONTRACT_OK base=#{base} skills=#{skill_paths.size}"
  exit 0
end

puts 'BEHAVIOR_CONTRACT_FAILED'
failures.each { |f| puts "- #{f}" }
exit 1
