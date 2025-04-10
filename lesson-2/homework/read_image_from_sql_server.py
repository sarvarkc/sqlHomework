import pyodbc # SQL SERVER

con_str = "DRIVER={SQL SERVER};SERVER=VICTUS;DATABASE=master;Trusted_Connection=yes;"
con = pyodbc.connect(con_str)
cursor = con.cursor()

cursor.execute(
    """
    SELECT * FROM photos;
    """
)

row = cursor.fetchone()
id, image_data = row

with open(f'Image.png', 'wb') as f:
    f.write(image_data)
