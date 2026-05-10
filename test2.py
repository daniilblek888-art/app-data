import psycopg2

def create_db():
    conn = psycopg2.connect(
            database="test_1",
            user="postgres",
            password="1234",
            host="127.0.0.1",
            port="5432"
        )
    with conn.cursor() as cur:
        cur.execute(
            """CREATE TABLE IF NOT EXISTS clients (
                    id SERIAL PRIMARY KEY,
                    first_name VARCHAR(50) NOT NULL,
                    last_name VARCHAR(50) NOT NULL,
                    email VARCHAR(100) UNIQUE NOT NULL
                );
                
                CREATE TABLE IF NOT EXISTS phones (
                    id SERIAL PRIMARY KEY,
                    phones_number VARCHAR(20) UNIQUE,
                    client_id INTEGER NOT NULL REFERENCES clients(id) ON DELETE CASCADE
                );
                    """)
        conn.commit()

    conn.close()
    print("Таблицы созданы")
create_db()


def add_phone(conn, client_id, phones_number):
    with conn.cursor() as cur:
        insert_query = """INSERT INTO phones (phones_number, client_id)
                    VALUES (%s, %s);
"""
        cur.execute(insert_query, (phones_number, client_id))  

        conn.commit()
    print(f"Телефон {phones_number} успщно добавлен")

def delete_phone(conn, client_id, phones_number):
    with conn.cursor() as cur:
        delete_query="""
        DELETE FROM phones
        WHERE phones_number = %s and client_id = %s;
        """
        cur.execute(delete_query, (phones_number, client_id))

        conn.commit()
    print(f"телефон {phones_number} удален из клиента {client_id}")

def update_client(conn, client_id, first_name=None, last_name=None, email=None):
    with conn.cursor() as cur:
        update_query= """UPDATE clients 
                         SET first_name = COALESCE(%s, first_name),
                         last_name = COALESCE(%s, last_name),
                         email = COALESCE(%s, email)
                         WHERE id = %s;
"""
        cur.execute(update_query, (first_name, last_name, email, client_id))
        conn.commit()
        print(f"Данные клиент{client_id} обновлены")

def find_client(conn, first_name = None, last_name = None, email = None, phone=None):
    with conn.cursor() as cur:
        find_query = """
            SELECT c.id, c.first_name, c.last_name, c.email, p.phones_number
            FROM clients c
            LEFT JOIN phones p ON c.id = p.client_id
            WHERE (c.first_name = %s or %s is NULL)
            AND (c.last_name = %s or %s is NULL) 
            AND (c.email = %s or %s is NULL)
            AND (p.phones_number = %s OR %s IS NULL);
            """
        cur.execute(find_query, (first_name, first_name, last_name, last_name, email, email, phone, phone))
        return cur.fetchall()


def add_client(conn, first_name, last_name, email, phones=None):
    with conn.cursor() as cur:
        cur.execute("""
            INSERT INTO clients (first_name, last_name, email)
            VALUES (%s, %s, %s) RETURNING id;
        """, (first_name, last_name, email))
        client_id = cur.fetchone()[0]
        
        if phones:
            for phone in phones:
                add_phone(conn, client_id, phone)
        
        conn.commit()
        return client_id
    
def delete_client(conn, client_id):
    with conn.cursor() as cur:
        cur.execute("DELETE FROM clients WHERE id = %s;", (client_id,))
        conn.commit()
    print(f"Клиент {client_id} и все его телефоны удалены")

if __name__ == "__main__":
    params = {
        "database": "test_1",
        "user": "postgres",
        "password": "1234",
        "host": "127.0.0.1",
        "port": "5432"
    }
    
    with psycopg2.connect(**params) as conn:
        create_db()
        
        new_client_id = add_client(conn, "Alenochka", "Ivanova", "test_mail@mail.kz")
        
        add_phone(conn, new_client_id, "+77070001122")
        
        search_results = find_client(conn, first_name="Alenochka")
        print(f"Нашли в базе: {search_results}")
        
        update_client(conn, new_client_id, last_name="Petrova")
        
        delete_phone(conn, new_client_id, "+77070001122")