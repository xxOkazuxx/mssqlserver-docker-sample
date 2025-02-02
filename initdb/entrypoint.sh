#!/bin/bash

# SQL Server をバックグラウンドで起動
/opt/mssql/bin/sqlservr & 
sqlservr_pid=$!

echo "Waiting for SQL Server to start..."
# sqlcmd で接続テスト（環境変数 SA_PASSWORD を使っているので、シェル内でそのまま利用できます）
sleep 15

echo "Running initialization script..."
/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "$SA_PASSWORD" -C -i /docker-entrypoint-initdb.d/init.sql

# SQL Server のプロセスが終了しないように待機
wait $sqlservr_pid
