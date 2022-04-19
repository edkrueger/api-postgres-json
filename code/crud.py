from database import engine
import json


def insert_many_business(businesses):
    """Takes a list of teachers as a dicts. Uses a list of dicts as parameters to insert into sqlalchemy_teachers."""

    insert_template = """
        insert into business (id, business_info)
        values (%(id)s, %(business_info)s);
    """

    with engine.connect() as connection:
        connection.exec_driver_sql(insert_template, businesses)
