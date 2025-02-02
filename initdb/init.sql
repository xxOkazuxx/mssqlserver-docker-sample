-- データベースの存在チェック：存在しなければ作成
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'MyDatabase')
BEGIN
    CREATE DATABASE MyDatabase;
END
GO

USE MyDatabase;
GO

-- テーブルの存在チェック：存在しなければ作成
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'MyTable')
BEGIN
    CREATE TABLE MyTable (
        ID INT IDENTITY(1,1) PRIMARY KEY,
        Name NVARCHAR(100)
    );
    
    -- 初期データの投入
    INSERT INTO MyTable (Name) VALUES ('Alice'), ('Bob'), ('Charlie'), ('David');
END
GO

SELECT * FROM MyTable
GO
