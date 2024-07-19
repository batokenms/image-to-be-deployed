# Use an official NODE as a parent image
FROM node:7      
ADD app.js /app.js    
ENTRYPOINT ["node","app.js"]  
 

