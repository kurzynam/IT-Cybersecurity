import sqlite3

conn = sqlite3.connect("mydb.db")
cursor = conn.cursor()

query = """
SELECT nickname, email
FROM users
"""

cursor.execute(query)

rows = cursor.fetchall()

for row in rows:
    print(row)

conn.close()