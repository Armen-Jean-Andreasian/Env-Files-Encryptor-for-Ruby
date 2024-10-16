# File Encryptor for Ruby

---
## Intro

This script encrypts your files using **AES-256-CBC** with a custom key.

It's useful to encrypt secrets, etc. 

In the examples we're gonna stick with `.env` files and `master.key` as the encryption key. 

---

## Usage

INFO: Files: `.env.test`, `.env.development`, `config/master.key` are for demonstrational purposes only. You don't need to share any of those files on GitHub.

1. Open [env_retriever.rb](env_retriever.rb) edit the line 64, add the files you need to encrypt.
2. **Encrypt the `.env` file(s)**:
    - Run the encryption script to encrypt the `.env` files.
    - Add the original `.env` files to `.gitignore` or delete them to prevent them from being pushed to version control.
    - Push the encrypted `.env.enc` files to GitHub instead.

3. **Decrypt when needed**:
    - Decrypt the `.env.enc` files during the deployment or when needed by using the provided decryption method.

The script uses only `openssl` lib, which is built-in. 

---

## Integration

You can integrate the decryptor into your application depending on your preference:

1. Add the decryptor script to your app's root directory via the terminal.
      
   - To encrypt:
   ```bash
   ruby -r './env_retriever.rb' -e 'EnvRetriever.encrypt_files'
   ```
   
   - To decrypt:
   ```bash
   ruby -r './env_retriever.rb' -e 'EnvRetriever.decrypt_files'
   ```

2. Integrate it into your application’s core logic (e.g., `application.rb` in a Rails app), initializers, etc.
   - Using import `require_relative`
   - Just move the modules straight into file.

---

## Playground

1. clone the repo
2. ```bash
   ruby -r './env_retriever.rb' -e 'EnvRetriever.encrypt_files'
   ```
3. ```bash
   ruby -r './env_retriever.rb' -e 'EnvRetriever.decrypt_files'
   ```
4. Works? You're good to go.
