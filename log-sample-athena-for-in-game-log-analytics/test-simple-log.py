import json
from datetime import datetime
from datetime import timedelta
import random



def ingame_log(timestamp, user_id, device, game, stage, action, item_id ):
    game_log={}
    game_log['time']=timestamp
    game_log['uid']=user_id
    game_log['device']=device
    game_log['game']=game
    game_log['stage']=stage
    game_log['action']=action
    game_log['itemid']=item_id

    return game_log

def append_log(timestamp, user_id, device, game, stage, action, item_id, filename ):
    log = ingame_log(timestamp,user_id, device, game, stage, action, item_id )
    with open (filename, "a") as file:
        json.dump(log, file)
        file.write("\n")


#print(json.dumps(ingame_log(1,"ios","alpha", 1, "start", 1)))
#append_log(1,"ios","alpha", 1, "start", 1, "logfile")
filename="logfile"
for u in range(1000, 100000):
    for st in range(0, 10):
        timestamp = datetime.now()+timedelta(days=st)
        append_log(timestamp.strftime("%Y-%m-%d %H:%M:%S"),u, "ios", "alpha", st+1, "start", u%5+1, filename)
        if random.random()>0.95:
            break
        if st == 2 and random.random()>0.25:
            break
        timestamp =  datetime.now()+timedelta(days=st, minutes=10*(st+1)+(st+1)*random.normalvariate(0,1))
        append_log(timestamp.strftime("%Y-%m-%d %H:%M:%S"),u, "ios", "alpha", st+1, "end", u%5+1, filename)

