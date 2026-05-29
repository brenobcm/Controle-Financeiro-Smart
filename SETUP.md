# BCM Finance · Guia de Configuração (Supabase + Netlify)

## 1. Criar conta e projeto no Supabase

1. Acesse **https://supabase.com** e clique em **Start your project**
2. Crie uma conta (gratuita) com Google ou e-mail
3. Clique em **New project**
4. Preencha:
   - **Name:** BCM Finance
   - **Database Password:** crie uma senha forte (guarde-a)
   - **Region:** South America (São Paulo)
5. Aguarde ~2 minutos até o projeto ficar pronto

---

## 2. Criar as tabelas (schema)

1. No painel do Supabase, clique em **SQL Editor** (ícone no menu lateral)
2. Clique em **New query**
3. Copie todo o conteúdo do arquivo **`schema.sql`** e cole na caixa
4. Clique em **Run** (ou Ctrl+Enter)
5. Confirme que aparece "Success. No rows returned"

---

## 3. Copiar as credenciais

1. No menu lateral clique em **Project Settings** → **API**
2. Copie:
   - **Project URL** (ex: `https://abcxyz123.supabase.co`)
   - **anon / public** key (chave longa começando com `eyJ...`)

---

## 4. Configurar o app

1. Abra o arquivo **`index.html`** em um editor de texto
2. Localize as linhas (perto do início do `<script>`):
   ```javascript
   const SUPABASE_URL = 'https://SEU_PROJETO.supabase.co';
   const SUPABASE_KEY = 'SUA_CHAVE_ANONIMA';
   ```
3. Substitua pelos valores copiados no passo 3
4. Salve o arquivo

---

## 5. Publicar na internet (Netlify — grátis)

1. Acesse **https://netlify.com** e crie uma conta gratuita
2. Na página inicial clique em **Add new site** → **Deploy manually**
3. Arraste a **pasta BCM** inteira para a área indicada
4. Aguarde alguns segundos — seu app receberá uma URL pública  
   (ex: `https://bcm-finance-xyz.netlify.app`)
5. Acesse a URL, crie sua conta no app e comece a usar!

---

## Resultado

- ✅ Dados salvos no PostgreSQL (Supabase) — nunca perderá nada
- ✅ Acesso de qualquer dispositivo com internet
- ✅ Login com e-mail e senha
- ✅ Cada usuário vê apenas seus próprios dados
- ✅ Gratuito para uso pessoal

## Migração de dados antigos

Se você tinha dados no localStorage (navegador local), ao fazer o primeiro login
o app vai detectar automaticamente e perguntar se deseja migrar para a nuvem.
