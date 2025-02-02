FROM mcr.microsoft.com/mssql/server:2022-latest

USER root
SHELL ["/bin/bash", "-c"]

# 作業ディレクトリを初期化スクリプトの配置先に変更
WORKDIR /docker-entrypoint-initdb.d

# initdb ディレクトリ内の全ファイルをコピー
COPY ./initdb/ /docker-entrypoint-initdb.d/

# スクリプトに実行権限を付与
RUN chmod -R +x /docker-entrypoint-initdb.d

EXPOSE 1433

# entrypoint.sh をエントリーポイントとして実行
ENTRYPOINT ["/bin/bash", "/docker-entrypoint-initdb.d/entrypoint.sh"]
