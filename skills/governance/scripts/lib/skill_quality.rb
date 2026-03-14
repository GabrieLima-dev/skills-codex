# frozen_string_literal: true

module SkillGovernance
  module Quality
    STRUCTURAL_CHECKS = {
      "Objetivo Operacional" => /##\s+Objetivo Operacional/i,
      "Escopo" => /##\s+Escopo/i,
      "Entradas Obrigatórias" => /##\s+Entradas Obrigatórias/i,
      "Fluxo Operacional" => /##\s+Fluxo Operacional \(Determinístico\)/i,
      "Contrato de Saída" => /##\s+Contrato de Saída/i,
      "Fail-Safe" => /##\s+Fail-Safe e Tratamento de Ambiguidade/i,
      "Guardrails" => /##\s+Guardrails/i,
      "Checklist de Qualidade" => /##\s+Checklist de Qualidade/i,
      "Referência explícita" => /references\//i,
      "Critério de decisão" => /(crítico|alto|médio|baixo|status|critério|criterio)/i
    }.freeze

    module_function

    def discover_skill_paths(base)
      Dir.glob(File.join(base, "*", "SKILL.md")).sort
    end

    def evaluate_skill(skill_path)
      skill_dir = File.dirname(skill_path)
      skill_name = File.basename(skill_dir)
      skill_text = File.read(skill_path)

      structural = STRUCTURAL_CHECKS.transform_values { |pattern| !!(skill_text =~ pattern) }
      structural_score = structural.values.count(true) * 10

      references_score, ref_details = evaluate_references(skill_dir)

      total_score = ((structural_score * 0.7) + (references_score * 0.3)).round

      {
        name: skill_name,
        path: skill_path,
        structural_checks: structural,
        structural_score: structural_score,
        references_score: references_score,
        references_details: ref_details,
        total_score: total_score,
        status: status_from_score(total_score)
      }
    end

    def evaluate_base(base)
      discover_skill_paths(base).map { |skill_path| evaluate_skill(skill_path) }
    end

    def status_from_score(score)
      return "A" if score >= 90
      return "B" if score >= 80
      return "C" if score >= 70

      "D"
    end

    def evaluate_references(skill_dir)
      ref_dir = File.join(skill_dir, "references")
      unless Dir.exist?(ref_dir)
        return [0, ["references/: ausente"]]
      end

      refs = Dir.glob(File.join(ref_dir, "*.md")).sort
      return [30, ["references/: presente", "arquivos .md: 0"]] if refs.empty?

      points = 0
      details = []

      points += 30
      details << "references/: presente"

      points += 30
      details << "arquivos .md: #{refs.size}"

      non_empty = refs.count { |path| !File.read(path).strip.empty? }
      if non_empty == refs.size
        points += 20
        details << "arquivos não vazios: #{non_empty}/#{refs.size}"
      else
        details << "arquivos não vazios: #{non_empty}/#{refs.size}"
      end

      with_h2 = refs.count { |path| File.read(path) =~ /^##\s+/ }
      if with_h2 == refs.size
        points += 20
        details << "arquivos com seções H2: #{with_h2}/#{refs.size}"
      else
        details << "arquivos com seções H2: #{with_h2}/#{refs.size}"
      end

      [points, details]
    end
  end
end
