## Q1
I will choose **POST**.  
First, POST sends the data in the **body of the HTTP request**, not like **GET** in the URL.  
Also, GET is limited in the size of data.  
Generally, any sensitive process we do it by **POST**.

---

## Q2
We use it because:

1. **Accessibility** – for the people who can't see, they use applications to read the page for them. When we use `div`, the application doesn't know where the start, the end, or the main section is.  
2. It makes the code **readable** and **easy to maintain**.  
3. It's supported by **modern browsers**.

---

## Q3
The browser doesn't understand the name of a domain like **"google.com"**. It needs the **IP address**.  
The browser makes a request to **DNS (Domain Name System)**. It gets the domain name and resolves it to an IP address.

After that, the browser does a **TCP/IP handshake** to make sure the server is ready to accept requests.

Then we send the **HTTP request** like **GET** if we want a specific page.

The server accepts the request, and if everything is OK, it gives us a **200 response**, which means **OK**,  
and sends the files (**HTML + CSS + JavaScript**).

The browser receives the files and **renders** them to make them visible and readable to you.s 