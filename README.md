
# Sistema de Gestão de Clientes

## 🧱 Tecnologias
- **Backend**: Ruby on Rails
- **Frontend**: HTML/CSS (simples ou futuro app)
- **Banco de Dados**: PostgreSQL
- **Autenticação**: Devise (sessões via cookie)
- **Upload de Arquivos**: Active Storage ou Paperclip
- **Autorização**: Pundit ou CanCanCan

---

## 👤 Tipos de Usuário
1. **Admin**: Acesso total ao sistema  
2. **Atendente**: Gerencia clientes, orçamentos e arquivos  
3. **Cliente (empresa)**: Acesso restrito aos próprios dados e orçamentos  

Usuário conterá um campo `role` para identificar o tipo:
```ruby
enum role: { admin: 0, attendant: 1, client: 2 }
```

---

## 📦 Entidades principais

### 1. User
- name  
- email  
- cpf
- password_digest (ou Devise padrão)  
- role (enum)  

### 2. Client
- name (razão social)  
- cnpj  
- email  
- phone  
- address  
- user_id (relaciona com usuário cliente)  

### 3. Estimate
- client_id (referência para Client)  
- description  
- value  
- status (pendente, aprovado, recusado)  
- due_date  

### 4. Attachment
- attachable (polimórfico: Client ou Estimate)  
- file (upload)  
- uploaded_by (user_id)  

---

## 💡 Funcionalidades Extras

### 🔒 Autenticação e Autorização
- Login tradicional via sessão (Devise)  
- Controle de acesso por `role`  

### 📜 Histórico de Atividades
- Log de ações (criação, edição, login etc.)  
- Ex: `ActivityLog` com user_id, action, target, timestamp  

### 💬 Comentários
- Comentários internos nos orçamentos (model `Comment`)  
- Visíveis apenas por admins/atendentes  

### 📁 Upload de Arquivos
- Upload de documentos e imagens  
- Visualização e validação  

### 📄 Geração de PDFs
- Exportar orçamentos como PDF (Prawn ou WickedPDF)  
- Botão para envio por e-mail  

### 🔔 Notificações
- Internas no sistema  
- E-mails de atualização de status  

### 📊 Relatórios
- Total de orçamentos por período  
- Filtragem por cliente, atendente, status  

### ✅ Aprovação Digital
- Cliente pode aprovar/recusar orçamentos no painel  
- Registro da decisão com timestamp  

---

## 🛠️ Etapas de Desenvolvimento
1. Criação do projeto Rails e configuração básica  
2. Modelagem das entidades principais  
3. Implementação da autenticação com Devise  
4. Autorização por `role`  
5. CRUDs com testes (RSpec)  
6. Upload e visualização de arquivos  
7. Geração de PDFs  
8. Comentários e notificações  
9. Deploy (Render, Fly.io, Railway etc.)  
10. Frontend ou mobile app (futuro)  

---

Esse documento pode ser expandido com wireframes, regras de negócio detalhadas e funcionalidades adicionais conforme o projeto evolui.
