library(MASS)

load_vector <- floor(runif(10, min = 0, max = 4))

#Definition of parameters to plot the vectors
length_vector <- length(load_vector) + 0

plot(load_vector, type = "s", xlim = c(0,length_vector), main = "Load Vector - toollbooth", ylab = "Cars in the queue", 
     xlab = "Time [min]", col ="blue")

lines( bin_load_svr, col = "red", type = "s")

grid(nx = length(load_vector), ny = NULL, col = "lightgray", lty = "dotted")

par(mar = c(5.1,4.1,4.1,10.1), xpd = TRUE)

legend("topright", c ("Load System","Load Server"), fill = c("blue","red"), 
       inset = c(-0.5,0))

#Logical condition to evaluate when the system is vancacy/busy
bin_load_svr <- load_vector !=0

#Compute of average of load in the server
avg_load_svr <- fractions(mean(bin_load_svr))

avg_load_svr

#Compute of length of queues in the vector
queue_length <- load_vector - bin_load_svr

#Compute of average length queue 
avg_queue <- fractions(mean(queue_length))

avg_queue

#Compute of cars in the system during the time of observation
avg_cars_fraction <- fractions(mean(load_vector))

avg_cars_fraction
