
import pymysql

def work():
    username = input("Enter your username: ")
    password = input("Enter your password: ")
    try:
        cxn = pymysql.connect(host='localhost',
                              user=username,
                              password=password,
                              db='sharkdb',
                              cursorclass=pymysql.cursors.DictCursor)
    except pymysql.err.OperationalError as e:
        print('Invalid password or username'.format(e))
        exit()
    stmt_select = "select * from township"
    cur = cxn.cursor()
    cur.execute(stmt_select)
    validinput = False
    while (not validinput):
  #      try:
            town = input("Enter a town: ")
            state = input("Enter a state: ")
            for row in cur.fetchall():
                if row["town"] == town and row["state"] == state:
                    validinput = True
            if not validinput:
                print("Invalid town or state. Try again")
                print(town)
                print(state)
                print(validinput)
            cur.scroll(0,'absolute')
        # except pymysql.Error as e:
        #     print('Connection refused'.format(e))
        #     exit()
    print("Valid town or state")
    cur.close()
    c3 = cxn.cursor()
    c3.callproc("allReceivers", (town, state))
    for row in c3.fetchall():
        print(row)
    c3.close()

if __name__ == '__main__':
    work()
