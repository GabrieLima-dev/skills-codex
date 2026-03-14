# Checklist de Validação SDD v3

## 1. Rastreabilidade Obrigatória

1. Cada requisito do `PRD.md` foi mapeado para item da `Spec.md`.
2. Cada item da `Spec.md` possui evidência no código.
3. Cada critério de aceitação possui status (`coberto`, `parcial`, `não coberto`).

## 2. Qualidade e Regressão

1. Mudança está simples e legível.
2. Não há duplicação desnecessária.
3. Impactos colaterais foram analisados.
4. Regressões potenciais têm mitigação.

## 3. Segurança e Dados

1. Não houve introdução de segredo/dado sensível.
2. Arquivos sensíveis permanecem fora de versionamento.
3. Novas superfícies de risco foram documentadas.

## 4. Evidências de Teste

1. Quais testes/checks foram executados?
2. Quais não foram executados e por quê?
3. A evidência cobre cenários de sucesso, erro e regressão?
4. Tipos de teste aplicáveis foram cobertos (`unit`, `integration`, `e2e`, `contract`, `smoke`, `regression`)?
5. Nível de confiança final (`alto`, `médio`, `baixo`) foi justificado?
6. Mudanças de código têm evidência de TDD (`red -> green -> refactor`)?
7. Existe seção `como testar` com passos objetivos para API e FRONT quando aplicável?
8. O relatório de testes segue formato estruturado (`escopo`, `ambiente`, `matriz`, `comandos`, `resultados`, `lacunas`, `métricas`, `risco residual`)?
9. O usuário foi consultado explicitamente sobre execução de testes adicionais antes do encerramento?
10. Testes adicionais (se houver) só foram executados após comando explícito do usuário?

## 5. Classificação de Achados

- `crítico`: bloqueia publicação.
- `alto`: exige correção ou ressalva formal.
- `médio`: aceitável com acompanhamento.
- `baixo`: melhoria recomendada.

## 6. Decisão Final

- Status: `aprovado` | `aprovado com ressalvas` | `reprovado`
- Justificativa objetiva:
- Pendências obrigatórias antes do merge:
