from database import engine


def make_businesses_table():

    cmd = """
        create table if not exists business (
            id varchar,
            business_info JSON
        );
    """

    with engine.connect() as connection:
        connection.exec_driver_sql(cmd)


def create_tables():
    make_businesses_table()
