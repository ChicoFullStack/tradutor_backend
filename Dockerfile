# Etapa 1: Usar uma imagem base oficial do Python
# Usamos a versão 'slim' para manter a imagem final mais leve.
FROM python:3.10-slim

# Etapa 2: Definir o diretório de trabalho dentro do contêiner
WORKDIR /app

# Etapa 3: Copiar o ficheiro de dependências para o contêiner
# O '.' no final significa para copiar para o diretório de trabalho atual (/app)
COPY requirements.txt .

# Etapa 4: Instalar as dependências do projeto
# A flag --no-cache-dir reduz o tamanho da imagem, não guardando o cache do pip.
RUN pip install --no-cache-dir -r requirements.txt

# Etapa 5: Copiar todo o código do backend para o contêiner
# Isto inclui o seu ficheiro main.py e quaisquer outros que tenha.
COPY . .

# Etapa 6: Expor a porta em que a aplicação irá correr
# O FastAPI/Uvicorn está configurado para usar a porta 8000.
EXPOSE 8000

# Etapa 7: Definir o comando para iniciar a aplicação quando o contêiner arrancar
# Usamos --host 0.0.0.0 para tornar a aplicação acessível de fora do contêiner.
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
