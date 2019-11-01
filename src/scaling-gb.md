#Scaling to Gigabit

I was studying the IP layer processing in the kernel and decided to take a look under the hood, in the hopes of finding the routine that would explicitly call the software interrupt. What I've found, instead, is the ultimate effort of the network stack to scale to gigabit speeds and it's beautifully designed.