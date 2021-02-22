#immitetes transaction flow with kind of transaction data
Blocks  = [
[(1,'data'),(2,'not needed'),(3,'data'),(4,'not needed'),(5,'data')],
[(1,'data'),(2,'not needed'),(3,'data'),(4,'not needed'),(5,'data')],
[(1,'data'),(2,'not needed'),(3,'data'),(4,'not needed'),(5,'data')],
]
#this is last block that was successfully processed by algoritm 
LastBlock
#this is a immitation of a in-memory database for uploading block
db 

async def Reader_n_balancer():
    #putting elements in memory, we can do this asyncronus
    for elem in Blocks[LastBlock+1]:
        # you put tx data and bool flag if this tx is proc successfully
        #also, if thread goes to proccess this data, it locks the access
        #to the flag 
        db.push((elem,'untouched'))
    while (len(db) > 0):
        for elem in db:
            if db[i][1] == 'ready':
                db.remove(i)
    LastBlock+=1

async def worker():
    for i in db:
        if i[1] == 'untouched':
            i[1] = 'modifying'
            proc(i[0])
            i[1] = 'ready'
            



