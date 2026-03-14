---
name: vps-easypanel
description: Use esta skill para planejar, revisar ou executar deploy/operação do Projeto em VPS com Docker + EasyPanel, incluindo domínio, SSL, hardening, observabilidade e backup com critérios objetivos de segurança.
---

# Projeto VPS + EasyPanel

## Objetivo Operacional

Orientar decisões e execução de infraestrutura com baseline de segurança e operação reproduzível.

## Escopo

Incluído:
- Topologia de deploy no EasyPanel.
- DNS/domínios/certificados SSL.
- Hardening de host e runtime.
- Verificações de saúde, logs e backup.

Fora de escopo:
- Recomendações fora do stack Docker + EasyPanel sem solicitação explícita.
- Exposição de segredos/credenciais reais.
- Mudanças destrutivas em produção sem confirmação explícita.

## Entradas Obrigatórias

1. Ambientes alvo (staging/prod).
2. Domínios/subdomínios envolvidos.
3. Serviços a publicar (front, api, jobs).

Entradas opcionais:
- `references/deploy-checklist.md` para checklist detalhada.

## Fluxo Operacional (Determinístico)

1. Confirmar escopo de publicação (o quê, onde, quando).
2. Validar mapeamento DNS esperado por domínio/subdomínio.
3. Definir responsabilidade de SSL (EasyPanel) e política HTTPS obrigatório.
4. Aplicar baseline de segurança do host:
   - UFW apenas `22/80/443`
   - SSH por chave
   - root login desabilitado
   - Fail2Ban ativo
5. Aplicar baseline de segurança de runtime:
   - segredos só em env/secrets do painel
   - nenhum `.env` sensível ou dump em Git
   - volumes persistentes privados
6. Definir observabilidade mínima:
   - healthcheck front/api
   - logs acessíveis e retenção mínima
7. Definir política de backup:
   - frequência
   - retenção
   - cópia fora do host
8. Entregar plano ou status com pendências explícitas por criticidade.

## Contrato de Saída

Responder sempre com:
1. `Estado atual` (o que já está OK).
2. `Lacunas` (o que falta para operação segura).
3. `Ações priorizadas` por severidade (`crítico/alto/médio/baixo`).
4. `Critérios de pronto` para go-live.

## Fail-Safe e Tratamento de Ambiguidade

- Se domínio/ambiente não estiverem claros, não concluir go-live; marcar como bloqueio.
- Se houver conflito entre velocidade e segurança, priorizar segurança e registrar trade-off.
- Se algum requisito não for verificável, sinalizar como `não comprovado`.

## Guardrails

- Nunca incluir credenciais reais em exemplos.
- Nunca recomendar exposição de portas além do necessário sem justificativa.
- Nunca declarar ambiente “seguro” sem verificar host, runtime e backup.

## Checklist de Qualidade

- DNS, SSL, firewall, SSH e Fail2Ban foram cobertos.
- Gestão de segredos está explícita e segura.
- Observabilidade e backup têm critérios mínimos definidos.
- Bloqueios e riscos estão documentados com prioridade.
