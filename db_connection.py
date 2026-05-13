import sqlite3

conn = sqlite3.connect("mydb.db")

with open("database.sql", "r") as f:
    sql_script = f.read()

conn.executescript(sql_script)

print("Database created successfully!")

conn.close()