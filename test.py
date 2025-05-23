import oracledb

# Bỏ dòng này đi
# oracledb.init_oracle_client()

# Kết nối ở chế độ thin (default)
conn = oracledb.connect(user="ods_etl", password="LLApkXL87r6UehequGqQvuZ9", dsn="172.25.80.170:11521/educa", protocol="tcp")
print(conn.version)
