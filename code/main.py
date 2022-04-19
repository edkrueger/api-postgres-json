import json

from yelp_requests import business_search
from create_tables import create_tables
from crud import insert_many_business

if __name__ == "__main__":

    LOCATION = "Austin, TX"
    CATEGORIES = "coffee"

    create_tables()

    businesses = business_search(location=LOCATION, categories=CATEGORIES)

    business_data = [
        {"id": business["id"], "business_info": json.dumps(business)}
        for business in businesses
    ]

    insert_many_business(business_data)
