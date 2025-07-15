import pexpect as tvIOcWaEzXH, requests as gcvHRWDNAtP, os as HYuxiLqEnBj

IRfKPoaMSrY = "https://raw.githubusercontent.com/Wraith1vs11/Rejoin/refs/heads/main/Rejoin.py"
abLUqGknoFe = "NexusHTool.py"
if not HYuxiLqEnBj.path.exists(abLUqGknoFe):
    open(abLUqGknoFe, "w", encoding="utf-8").write(gcvHRWDNAtP.get(IRfKPoaMSrY).text)

oArhNFmeBLY = tvIOcWaEzXH.spawn(f"python3 {abLUqGknoFe}", encoding="utf-8")

bOgRUaHWPlQ = False
PdwBSmaUlJG = "1ed659e41f52164076ad9871651b94b930b104ba8de4e76351e6900f7a96a533"

while True:
    try:
        jXzOVtwsPdi = oArhNFmeBLY.readline().strip()
        if not jXzOVtwsPdi:
            continue
        if PdwBSmaUlJG in jXzOVtwsPdi:
            break
        if "Nhập key:" in jXzOVtwsPdi and not bOgRUaHWPlQ:
            oArhNFmeBLY.sendline("6a93622b3298abd8bb5e37c6fda0c420")
            bOgRUaHWPlQ = True
    except:
        continue

oArhNFmeBLY.interact()
