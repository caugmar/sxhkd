No Cinnamon (a interface padrão do Linux Mint), o gerenciador nativo de atalhos de teclado **não suporta acordes de teclas** (também conhecidos como _key chords_ ou sequências como `Ctrl+G` seguido de `F`) de forma direta. Se você tentar gravar um atalho nas configurações do sistema, ele vai registrar apenas a primeira combinação ou substituirá a digitação.

No entanto, como estamos falando de Linux, dá para contornar essa limitação facilmente usando um utilitário externo de gerenciamento de entrada. A solução mais robusta, leve e popular para isso é o **sxhkd** (_Simple X Hotkey Daemon_).

Aqui está o passo a passo de como estruturar isso no seu Mint:

---

### Passo 1: Instalar o sxhkd

Abra o seu terminal e instale o daemon:

```bash
sudo apt update
sudo apt install sxhkd

```

### Passo 2: Criar o arquivo de configuração

O `sxhkd` busca as configurações em `~/.config/sxhkd/sxhkdrc`. Vamos criar essa pasta e o arquivo:

```bash
mkdir -p ~/.config/sxhkd
touch ~/.config/sxhkd/sxhkdrc

```

Abra o arquivo `sxhkdrc` com o seu editor de texto preferido (pode ser o `nano`, `xed`, `vim`, etc.) e adicione a sintaxe para o acorde de teclas.

Para o seu exemplo de **`Ctrl+g` seguido de `f**`abrir o Firefox, a sintaxe funciona com um ponto e vírgula (`;` ) indicando a sequência:

```text
# Abrir o Firefox com Ctrl+g, f
ctrl + g ; f
    firefox

```

> **Dica extra de sintaxe:** Se você quiser criar um "sub-menu" inteiro a partir de `Ctrl+g`, você pode usar chaves. Por exemplo:
>
> ```text
> ctrl + g ; {f,t}
>     {firefox, nemo}
>
> ```
>
> _(Onde `Ctrl+g, f` abre o Firefox e `Ctrl+g, t` abre o gerenciador de arquivos Nemo)._

### Passo 3: Iniciar o sxhkd automaticamente com o Cinnamon

Agora precisamos garantir que o `sxhkd` rode em segundo plano sempre que você iniciar o sistema.

1. Abra o menu do Linux Mint e pesquise por **Aplicativos de Inicialização** (_Startup Applications_).
2. Clique no botão **"+"** na parte inferior e escolha **Comando personalizado**.
3. Preencha os campos da seguinte forma:

- **Nome:** `SXHKD (Atalhos em Acorde)`
- **Comando:** `sxhkd`
- **Atraso na inicialização:** `2` segundos (adicionar um pequeno delay garante que a interface gráfica já carregou totalmente).

4. Clique em **Adicionar**.

---

### Passo 4: Testar imediatamente

Para não precisar reiniciar a sessão só para testar, você pode rodar o daemon direto no terminal ou via `Alt+F2`:

```bash
sxhkd &

```

Agora, pressione `Ctrl+G`, solte as teclas e pressione `F`. O Firefox deve abrir normalmente.

**Nota importante:** Certifique-se de que a combinação inicial (no caso, `Ctrl+G`) não esteja sendo usada de forma global por nenhum atalho nativo do Cinnamon em _Configurações do Sistema -> Teclado -> Atalhos_, caso contrário, os dois gerenciadores podem entrar em conflito.
