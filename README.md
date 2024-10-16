# Env Files Encryptor for Ruby

This script encrypts your `.env` files using **AES-256-CBC** with a `master.key` as the encryption key.

---

## Usage

1. **Encrypt the `.env` file(s)**:
    - Run the encryption script to encrypt the `.env` files.
    - Add the original `.env` files to `.gitignore` or delete them to prevent them from being pushed to version control.
    - Push the encrypted `.env.enc` files to GitHub instead.

2. **Decrypt when needed**:
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
