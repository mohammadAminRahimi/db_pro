import mysql.connector


def register():
    pass

def entrance():
    pass

def get_info():
    pass








if __name__ == "__main__":

    mydb = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="J4T823AWZ",
    db="TEST"
    )
    mycursor = mydb.cursor()

    while True:

        num = int(input(" 1.registration \n 2.entrance \n 3.getting info"));

        if num==1:
            register()
        elif num==2:
            entrance()
        elif num==3:
            get_info()

        
