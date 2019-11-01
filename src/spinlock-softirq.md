% Spinlocks considered harmful
% Pedro Tammela
% Jun 29 2019

Spinlocks can be very tricky perfomance degraders in software interrupts. Mostly because software interrupts run concurrently and are not allowed to sleep.

Software interrupts are the infamous packet processing of the Linux kernel. Picture this, the entire network subsystem is built for maximum perfomance, but you misuse a spinlock to access a critical region for every packet.

The perfomance downgrade is monstrous.

That's because spinlocks will not preempt and enter a loop state when the lock is not acquired. Essentially, I was blocking the entire network processing with a single spinlock.

The solution was to use RCUs. Always use RCUs.
