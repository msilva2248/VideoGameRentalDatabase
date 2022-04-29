from ast import In
from asyncio.windows_events import NULL
from atexit import register
from cProfile import label
from cgitb import text
from email import message
import re
from tkinter.font import BOLD
from turtle import width
from typing import Container
from unittest import result
from urllib.parse import uses_relative
import mysql.connector
import tkinter  as tk 
from tkinter import * 
from tkinter import messagebox
from subprocess import call
import random

my_connect = mysql.connector.connect(
  host="localhost",
  user="root", 
  passwd="Silv@2248!",
  database="videogame_rental"
)

my_conn = my_connect.cursor()

class Frames(tk.Tk):
   def __init__(root):
      tk.Tk.__init__(root)
      root.geometry("400x400")
      root.title("Video Game Rental")
      root.frame = None
      root.switchFrame(Start)

   def switchFrame(root, frameClass):
      # Destory current frame and open new one
      newFrame = frameClass(root)
      if root.frame is not None:
         root.frame.destroy()
      root.frame = newFrame
      root.frame.pack()

class Start(tk.Frame):
   def __init__(root, parent):
      tk.Frame.__init__(root, parent)
      
      # Create text boxes
      username = tk.Entry(root, width=30)
      username.grid(row=0, column=1, padx=20)

      password = tk.Entry(root, width=30)
      password.grid(row=1, column=1)

      # Create text labels
      usernameLabel = tk.Label(root, text="Username: ")
      usernameLabel.grid(row=0, column=0)

      passwordLabel = tk.Label(root, text="Password: ")
      passwordLabel.grid(row=1, column=0)


      def Login():
         # Select from table in database
         sql = "SELECT username, password FROM customer"
         uname = username.get()
         pname = password.get()

         my_conn.execute(sql)
         result = my_conn.fetchall()

         for info in result:
            if(uname in info and pname in info):
               parent.switchFrame(Home)
               return
         if(uname=="" and pname==""):
            messagebox.showinfo("Required field empty!")
         else:
            messagebox.showinfo("Incorrect login, try again!")

            # Clear text boxes
            username.delete(0, END)
            password.delete(0, END)

         my_connect.commit()

      loginButton = tk.Button(root, text="Login", command=Login)
      loginButton.grid(row=3, column=0, columnspan=2, pady=10, padx=10, ipadx=100)

      registerButton = tk.Button(root, text="Register", command=lambda: parent.switchFrame(Register))
      registerButton.grid(row=4, column=0, columnspan=2, pady=10, padx=10, ipadx=100)

      staffLoginButton = tk.Button(root, text="Staff Login", command=lambda: parent.switchFrame(Staff))
      staffLoginButton.grid(row=11, column=0, columnspan=2, pady=10, padx=10, ipadx=100)

class Home(tk.Frame):
   def __init__(root, parent):
      tk.Frame.__init__(root, parent)

      def display():
         userSelection = clicked.get()
         
         sql = "select console_name from console"

         my_conn.execute(sql)
         results = my_conn.fetchall()

         for console in results:
            strconsole = "".join(console)
            matches = re.finditer(strconsole, userSelection)
            matchlst = [i.group(0) for i in matches]
            if(len(matchlst) == 0):
               print("empty list")
            else:
               #return
               print("match found" , matchlst)

            sql = "select console_id from console where console_name = %s"

            for i in matchlst:
               my_conn.execute(sql, matchlst)

               results = my_conn.fetchall()

               sql = "select title, rental_rate from videogame v, videogame_console v1, console c where c.console_id=v1.console_id and v1.videogame_id=v.videogame_id and c.console_id = %s"

               my_conn.execute(sql, *results)
               title = my_conn.fetchall()

               top = Tk()

               Listbox = tk.Listbox(top, height=10, width=25, activestyle='dotbox', fg="black")

               top.geometry("300x300")

               for game in title:
                  Listbox.insert(END, game)

               global label
               def select():
                  gameLabel.config(text=Listbox.get(ANCHOR))
                  label = gameLabel.cget("text")

               

               def insert():
                  gameLabel.config(text=Listbox.get(ANCHOR))
                  label = gameLabel.cget("text")

                  sql = """INSERT INTO videogame_rental.order (title, rental_rate) VALUES (%s, %s)"""
                  li = list(label.split("}"))

                  print("this is type l ", li)

                  for x in li:
                     my_conn.execute(sql, li)
                     result = my_conn.fetchall()

                     # Commit your changes in the database
                     my_connect.commit()

                     print("this is result ", *result)


               selectButton = tk.Button(top, text="Select", command=select)
               selectButton.grid(row=1, column=0)

               gameLabel = tk.Label(top, text="")
               gameLabel.grid(row=2, column=0)

               placeOrderButton = tk.Button(top, text="Place Order", command=insert)
               placeOrderButton.grid(row=3, column=0)
            
               Listbox.grid(row=0, column=0, columnspan=2, ipadx=30)
               top.mainloop()

      sql = "SELECT console_name from console"
      my_conn.execute(sql)
      results = my_conn.fetchall()

      # Create dop down box
      clicked = StringVar(root)
      clicked.set("Select console from menu ")

      drop = OptionMenu(root, clicked, *results)
      drop.grid(row=8, column=0)

      searchButton = tk.Button(root, text="Search", command=display)
      searchButton.grid(row=9, column=0)

      logoutButton = tk.Button(root, text="Logout", command=lambda: parent.switchFrame(Start))
      logoutButton.grid(row=10, column=0)

class Staff(tk.Frame):
   # Connection to database
   my_connect = mysql.connector.connect(
      host="localhost",
      user="root", 
      passwd="Silv@2248!",
      database="videogame_rental"
   )

   my_conn = my_connect.cursor()

   def __init__(root, parent):
      tk.Frame.__init__(root, parent)

      # Create text boxes
      username = tk.Entry(root, width=30)
      username.grid(row=0, column=1, padx=20)

      password = tk.Entry(root, width=30)
      password.grid(row=1, column=1)

      # Create text labels
      usernameLabel = tk.Label(root, text="Username: ")
      usernameLabel.grid(row=0, column=0)

      passwordLabel = tk.Label(root, text="Password: ")
      passwordLabel.grid(row=1, column=0)

      def staffLogin():
         # Select from table in database
         sql = "SELECT username, password FROM staff"
         uname = username.get()
         pname = password.get()

         my_conn.execute(sql)
         result = my_conn.fetchall()

         for info in result:
            if(uname in info and pname in info):
               parent.switchFrame(Home)
               return
         if(uname=="" and pname==""):
            messagebox.showinfo("Required field empty!")
         else:
            messagebox.showinfo("Incorrect login, try again!")

            # Clear text boxes
            username.delete(0, END)
            password.delete(0, END)

         my_connect.commit()

      loginButton = tk.Button(root, text="Login", command=lambda:[staffLogin(), parent.switchFrame(StaffHome)])
      loginButton.grid(row=3, column=0, columnspan=2, pady=10, padx=10, ipadx=100)

      backButton = tk.Button(root, text="Back", command=lambda: parent.switchFrame(Start))
      backButton.grid(row=4, column=0, columnspan=2, pady=10, padx=10, ipadx=100)

class Account(tk.Frame):
   # Connection to database
   my_connect = mysql.connector.connect(
      host="localhost",
      user="root", 
      passwd="Silv@2248!",
      database="videogame_rental"
   )

   my_conn = my_connect.cursor()

   def __init__(root, parent):
      tk.Frame.__init__(root, parent)

      my_w = tk.Tk()
      my_w.geometry("760x350")

      sql = "select * from customer"
      my_conn.execute(sql)

      results = my_conn.fetchall()
      #print(results)

      i=0
      for account in results:
         #print("this is account ", account)
         for j in range(len(account)):
            e = Label(my_w, width=20, fg='black', text=account[j], relief='ridge', anchor="w")
            e.grid(row=i, column=j)
         i=i+1
      my_w.mainloop()

class Inventory(tk.Frame):
   # Connection to database
   my_connect = mysql.connector.connect(
      host="localhost",
      user="root",
      passwd="Silv@2248!",
      database="videogame_rental"
   )

   my_conn = my_connect.cursor()

   def __init__(root, parent):
      tk.Frame.__init__(root, parent)

      my_w = tk.Tk()
      my_w.geometry("400x350")

      sql = "select title, rental_rate, console_name from videogame_rental.videogame join videogame_rental.videogame_console on videogame_rental.videogame.videogame_id=videogame_rental.videogame_console.videogame_id join videogame_rental.console on videogame_rental.videogame_console.console_id=videogame_rental.console.console_id"
      my_conn.execute(sql)

      results = my_conn.fetchall()
      #print(results)

      i=0
      for account in results:
         #print("this is account ", account)
         for j in range(len(account)):
            e = Label(my_w, width=18, fg='black', text=account[j], relief='ridge', anchor="w")
            e.grid(row=i, column=j)
         i=i+1
      my_w.mainloop()

class Orders(tk.Frame):
   # Connection to database
   my_connect = mysql.connector.connect(
      host="localhost",
      user="root",
      passwd="Silv@2248!",
      database="videogame_rental"
   )

   my_conn = my_connect.cursor()

   def __init__(root, parent):
      tk.Frame.__init__(root, parent)

      sql = "select * from videogame_rental.order"
      my_conn.execute(sql)
      orders = my_conn.fetchall()

      def delete():
         orderLabel.config(text=Listbox.get(ANCHOR))
         label = orderLabel.cget("text")
         updatedLabel = label.replace("\\", "")
         newLabel = updatedLabel.replace(" {", ",")
         lastLabel = newLabel.replace("}", "")

         sql = """DELETE from videogame_rental.order where title = %s or rental_rate = %s"""
         li = list(lastLabel.split(", "))

         for x in li:
            my_conn.execute(sql, li)
            result = my_conn.fetchall()

            # Commit your changes in the database
            my_connect.commit()

      top = Tk()

      Listbox = tk.Listbox(top, height=10, width=25, activestyle='dotbox', fg="black")

      top.geometry("300x300")

      for order in orders:
         Listbox.insert(END, order)

      global label

      orderLabel = tk.Label(top, text="")
      orderLabel.grid(row=2, column=0)
   
      Listbox.grid(row=0, column=0, columnspan=2, ipadx=30)
      deleteOrderButton = tk.Button(top, text="Delete Order", command=delete)
      deleteOrderButton.grid(row=1, column=0)

      top.mainloop()

class StaffHome(tk.Frame):
   # Connection to database
   my_connect = mysql.connector.connect(
      host="localhost",
      user="root", 
      passwd="Silv@2248!",
      database="videogame_rental"
   )

   my_conn = my_connect.cursor()

   def __init__(root, parent):
      tk.Frame.__init__(root, parent)

      viewAccountButton = tk.Button(root, text="View Accounts", command=lambda: parent.switchFrame(Account))
      viewAccountButton.grid(row=10, column=0)

      viewInventoryButton = tk.Button(root, text="Inventory", command=lambda: parent.switchFrame(Inventory))
      viewInventoryButton.grid(row=10, column=1)

      viewOrdersButton = tk.Button(root, text="View Orders", command=lambda: parent.switchFrame(Orders))
      viewOrdersButton.grid(row=10, column=2)

      backButton = tk.Button(root, text="Back", command=lambda: parent.switchFrame(Staff))
      backButton.grid(row=11, column=1)

class Register(tk.Frame):
   # Connection to database
   my_connect = mysql.connector.connect(
      host="localhost",
      user="root", 
      passwd="Silv@2248!",
      database="videogame_rental"
   )

   my_conn = my_connect.cursor()

   def __init__(root, parent):
      tk.Frame.__init__(root, parent)

      # Create text boxes
      username = tk.Entry(root, width=30)
      username.grid(row=0, column=1, padx=20)

      password = tk.Entry(root, width=30)
      password.grid(row=1, column=1)

      first_name = tk.Entry(root, width=30)
      first_name.grid(row=2, column=1)

      last_name = tk.Entry(root, width=30)
      last_name.grid(row=3, column=1)

      email = tk.Entry(root, width=30)
      email.grid(row=4, column=1)

      # Create text labels
      usernameLabel = tk.Label(root, text="Username: ")
      usernameLabel.grid(row=0, column=0)

      passwordLabel = tk.Label(root, text="Password: ")
      passwordLabel.grid(row=1, column=0)
      
      first_nameLabel = tk.Label(root, text="First Name: ")
      first_nameLabel.grid(row=2, column=0)

      last_nameLabel = tk.Label(root, text="Last Name: ")
      last_nameLabel.grid(row=3, column=0)
      
      emailLabel = tk.Label(root, text="Email: ")
      emailLabel.grid(row=4, column=0)

      def Insert():
         # Insert into table
         sql = "INSERT INTO customer (username, password, first_name, last_name, email) VALUES (%s, %s, %s, %s, %s)"
         val = (username.get(), password.get(), first_name.get(), last_name.get(), email.get())

         my_conn.execute(sql, val)

         # Commit your changes in the database
         my_connect.commit()

         # Clear text boxes
         username.delete(0, END)
         password.delete(0, END)
         first_name.delete(0, END)
         last_name.delete(0, END)
         email.delete(0, END)

      registerButton = tk.Button(root, text="Register", command=lambda:[Insert(), parent.switchFrame(Start)])
      registerButton.grid(row=5, column=0, columnspan=2, pady=10, padx=10)

      backButton = tk.Button(root, text="Back", command=lambda: parent.switchFrame(Start))
      backButton.grid(row=6, column=0, columnspan=2, pady=10, padx=10)

if __name__ == "__main__":
   root = Frames()
   root.mainloop()