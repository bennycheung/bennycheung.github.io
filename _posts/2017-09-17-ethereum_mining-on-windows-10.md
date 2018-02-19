---
layout: post
title: Ethereum Mining on Windows 10
date: 2017-09-17 01:00:00.000000000 -05:00
permalink: ethereum-mining-on-windows-10
author: Benny Cheung
artwork:
  author: Clara Cheung
  url: https://www.instagram.com/pk_clara/
tags:
  - Mining
  - Ethereum
  - Crypto Currency
  - GPU
category: post
comments: true
image: images/ethereum-mining-on-windows-10/cover2x.jpg
images:
  cover: images/ethereum-mining-on-windows-10/cover.jpg
  header: images/ethereum-mining-on-windows-10/header.jpg
published: true
---
<!--excerpt.start-->
The value of dedicated GPU is going beyond the needs of gaming, it is proven to fulfill the professional needs for Deep Learning researches.
As it turns out the modern graphics cards are very good at achieving the framerate requirements for virtual-reality. To our biggest surprise, GPU is profitable at mining crypto-currency again, such as Ethereum, so we can profit from our current hardware setup. This article will run through the basic mining knowledge, and guides how to setup a Windows 10's machine with a GPU to do Ethereum mining.
<!--excerpt.end-->

## Bitcoin Mining History
A few years ago, after reading the paper by pseudonym author "Satoshi Nakamoto" on [Bitcoin: A Peer-to-Peer Electronic Cash System](https://bitcoin.org/bitcoin.pdf) describing a distributed trust solution to the open network, the sense of computational beauty about it's concepts and solutions propelled my interest to try out Bitcoin mining. The value of Bitcoin is approximately $120 USD at 2013, which is impressive for it's growth from zero value within a short few years of Bitcoin invention.

To reduce the risk of the adventure, like everyone at that time, we started out by utilizing the gaming GPU to reach a profitable hashrate (to be explained later).
The profitability is measured by how much coin value that you generated against how much electricity that you paid. If the coin value is higher then the cost of electricity, you are in a profitable mining business, excluding the initial equipment cost.
The original Bitcoin hashing algorithm (SHA256), performing a complex but fixed sequence of operation can be replaced by ASIC (Application Specific Integrated Circuit) dedicated hardware. The computation speed and power efficiency of ASIC essentially killed the profitability of using GPU based mining quickly. In order to stay in the Bitcoin mining game, Adafruit's instruction to build a [Raspberry Pi Bitcoin Miner](https://learn.adafruit.com/piminer-raspberry-pi-bitcoin-miner/initial-setup-and-assembly), which can hash at 2 GH/s with extremely low power consumption (see the following picture), will keep mining alive for a little longer.

![Raspberry Pi Mining Rig running at 2 GH/s]({{ site.baseurl }}images/ethereum-mining-on-windows-10/Bitcoin_RaspberryPi_Mining_Rig.jpg)

*Figure. Raspberry Pi Mining Rig running at 2 GH/s, the Raspberry Pi has attached to Adafruit 16x2 LCD + Keypad Kit to display mining statistics. The row of ASICMiner Block Erupter USB sticks, each is capable of 300 MH/s. The power consumption for each Block Erupter will be 5W, making the miner very profitable at 2013. But it is useless at 2017.*

For the history of Bitcoin mining, the rise of ASIC dedicated hardware basically destroyed all GPU-based mining profitability by the exponential grow of the [Bitcoin Network Difficulty](https://bitcoinwisdom.com/bitcoin/difficulty).

## Ethereum Mining
Until recently [Ethereum](https://www.ethereum.org/), which is believed to be [Bitcoin 2.0](https://bitconnect.co/bitcoin-news/89/is-ethereum-bitcoin-20), specifically designed it's [Ethash as Memory Hardness Algorithm](https://www.vijaypradeep.com/blog/2017-04-28-ethereums-memory-hardness-explained/) to make ASIC hardware based solution impractical; subsequently, Ethash has made GPU-based mining profitable again. Also, adding to the miner incentive, the Ethereum trading price has enjoyed some significant growth. Ethereum not only shows it's profitability but also the Ethereum trading liquidity as a popular cryptocurrency for the future.

As a Ethereum Miner and Researcher, there are few essential concepts must be clarified for the purpose of mining. If you don't care about the beauty of computing, you can skip ahead to the section of "Road to Mining".

### Blockchain for Distributed Trust
The key cryptocurrency technology is Blockchain. The Blockchain "locked-in" all the transactional facts into space and time, such that modification will be almost impossible in the open and distributed network. The "space" is the content and "time" is the sequence of contents. Imagine a **Block** content is the facts about money transfers, the Block's hash value will provide an unique signature (or digest) to tell if the Block's content is authentic. If the Block's content has been tempered in anyway, the hash value will be different so that everyone knows that the content cannot be trusted. Since the Blockchain has been distributed throughout the open network, other untempered copy of the Blockchain can continue to maintain the truth. The tempered Blockchain will simply be ignored.

![Explaining Blockchain Security by Showing the Hash Value is Linked Together]({{ site.baseurl }}images/ethereum-mining-on-windows-10/Explain_Blockchain_Security.jpg)

*Figure. This picture explains the Blockchain Security by showing the current Block has the hash value of the previous Block. If the previous Block content has been modified, the hash value will be different.*

In addition, this is impossible to reverse engineering the content to produce the same hash value, as if modifying the content enough to fake the hash value. This is the beauty of the [Cryptographic Hash Function](https://en.wikipedia.org/wiki/Cryptographic_hash_function); even if you changed a single character, the hash value will be changed so significantly such that you have no way to control the changes.

### Mining as Proof of Work for Values
For the Blockchain of cryptocurrency, e.g. Bitcoin or Ethereum, the Block's content will be the transfer of coins. Imagine the following Blocks for the coin transactions, we can always trace back the origin of a coin. For example, the coin sent by $$A$$ can be traced back in time through the Blockchain connectivity, where the totality of $$A$$ coins funding are received from $$B \rightarrow A$$ and $$C \rightarrow A$$ transactions. However, we have noticed the $$C$$ original funding seems to come from the thin air.

![Explaining Cryptocurrency Coin Generation as the value of Mining]({{ site.baseurl }}images/ethereum-mining-on-windows-10/Explain_Mining_Coin_Generation.jpg)

*Figure. This picture illustrated all coins sent and received can be traced through the Blockchain. Except the origin of $$C$$ funding seems to be generated from the thin air, which is the reward of mining.*

The original funding of $$C$$ is the reward of mining. The miner provides the computational power in the form of electricity consumption, to produce the hash value (signature) to a Block. The effort of finding the correct hash value is also known as [Proof of Work](https://en.bitcoin.it/wiki/Proof_of_work). The miner who first successfully found the correct hash value will be reward with some number of coins. This is precisely the concept of mining which is rewarding the coins for solving the hash value problem, benefiting the Blockchain to advance in space and time.

Many popular opinion doubts about the value of Bitcoin or Ethereum. The computational power in the form of electricity consumption is the value of the coin. Currently, generating 1 Bitcoin will cost approximately $1000 USD electricity, where the intrinsic value of Bitcoin is stored. While you are receiving the printed $100 USD bill, that bill has no intrinsic value other than a piece of paper promise. The $100 bill does not have any backing stored to retain it's value (no equivalent gold value is stored along with USD anymore). But the Bitcoin or Ethereum has the value stored by the difficulty of their generation.

### Difficulty for Timeliness
The remaining question is the significance of the network difficulty. Imagine the guessing game of between 1 to 10, the difficulty that one can guess it right is the chance of 1/10. We say the equivalent of 1 guess is equal 1 hash, the difficult is 10. In average, a player needs to guess 5 times before a guess is hitting the correct number. However, if this guessing game is having too many guesses happening in a short time, the correct guess may happen too fast. The guessing game's maker (the whole network) will automatically adjust the difficulty, adjusting from 10 to 100, to reduce the correct guess happening too fast. This is the essence of using the network difficulty to control how fast a correct guess can happen.

![Explaining Hash Difficulty]({{ site.baseurl }}images/ethereum-mining-on-windows-10/Explain_Hash_Difficulty.jpg)

*Figure. This picture explain the input of the hash function $$f()$$ must be manipulated to generate a hash result of specified difficulty. The difficulty is a pattern of easy comparison, in this case, the hash result is less than 100.*

In **NO** scenario that a miner should modify the transactional content, in order to manipulate the hash result, miner can only modify the "nonce" section to generate a hash result and check if the hash result meets the target requirements. For each "nonce" change, recompute the hash result and compare against the target requirements, is exactly **ONE** hash. The speed of Ethereum hash is currently measured by MH/s (1,000,000 hashes per second) by using a GPU. For instance, Nvidia GTX 1070 can compute 25 MH/s without overclock (after overclock, it gains 20% speed and reaches 30 MH/s).

Different cryptocurrency has different hash algorithm and requirements, but the essence of a hash is the same. If a miner be the first who compute the hash result matched the requirements against the whole network; then that winning miner will be reward with the coins! That's exactly the goal of mining. Obviously, only using a small computing resources winning against the whole network is very difficult; that's why the [Mining Pool](https://en.wikipedia.org/wiki/Mining_pool) concept can be applied to join force to win.

## Road to Mining
The prerequisite to mining is having a machine installed with a modern GPU. For a typical gamer or a Deep Learning researcher, you would probably have a Windows 10 machine ready to be deployed for Ethereum mining.

![Display Claymore Miner Hashrate and MSI After Burner GPU Settings]({{ site.baseurl }}images/ethereum-mining-on-windows-10/DX4_Ehtererum_1070_Overclock.jpg)

*Figure. Showing Claymore Ethereum Miner in action after all the following setup. GPU can be put to work hard for your money.*

Here is a quick run down on the 10 steps.

**(1) Setup the GPU on Windows 10**

**(2) Setup an Ethereum Wallet**: [Jaxx](https://jaxx.io) is a multipurpose cryptocurrency wallet that can run on any platform. Miner needs to get the public address of the Ethereum wallet; that public address is used to store the mining rewards.

![Jaxx Ethereum Wallet's Public Address]({{ site.baseurl }}images/ethereum-mining-on-windows-10/Jaxx_Ethereum_Wallet_public_address.jpg)

**(3) Ethereum Mining Software**: Download and install [Claymore-Ethereum-Miner](https://github.com/nanopool/Claymore-Dual-Miner/releases) that works with Nvidia GPU optimally. Please follow the [Mining Clients - Claymore - Windows](https://eth.nanopool.org/help) instructions from Nanapool help page, the next few steps repeat the important info.

For this article, the `Claymore's Dual Ethereum AMD GPU Miner v9.8 (Windows/Linux)` for Windows 10 is used.

**(4) Choose a Mining Pool to join**: Claymore Ethereum Miner's default is [Nanopool](https://nanopool.org/) which has a great API and Web UI. Miner doesn't need to register with Nanapool. As soon as a Ethereum's public address using Nanapool to receive some reward, the account will be automatically setup with that public address.

**(5) Install Overclock Tool**: [MSI Afterburner](https://www.msi.com/page/afterburner) as the overclock setup and monitor.
The following shows an optimal overclock settings for Nvidia GTX 1070 GPU, which produce 30 MH/s, 100 Watt power draw, 61C temperature with 40% fan speed.

![Nvidia GTX 1070 Overclock Settings]({{ site.baseurl }}images/ethereum-mining-on-windows-10/MSI_Afterburner_overclock_settings.jpg)

Since `Ethash` (Ethereum Hash function) is essentially GPU memory bounded, overclock the GPU memory is sufficient without increasing the GPU core clock. This should reduce the power draw and the temperature of the GPU, while maintaining a great hashrate!

**(6) Setup and run the Miner Script**: The Claymore miner comes with many batch scripts to do mining. For simplicity, starting with the Ethereum only mining script, follows the instructions to modify with your Ethereum wallet's public address.

This is how the `start_only_eth.bat` file should look after modification to miner's information:

```dos
setx GPU_FORCE_64BIT_PTR 0
setx GPU_MAX_HEAP_SIZE 100
setx GPU_USE_SYNC_OBJECTS 1
setx GPU_MAX_ALLOC_PERCENT 100
setx GPU_SINGLE_ALLOC_PERCENT 100

EthDcrMiner64.exe -epool eth-us-east1.nanopool.org:9999 -ewal 0xf1cfc50567acf36c55ba75540b7f1c3f1aaa9869/mining_name/my_email@gmail.com -epsw x -mode 1 -ftime 10
```

It is using Nanapool in US east cost address `eth-us-east1.nanopool.org:9999` as the mining pool. As a general rule of thumb, choose a pool address that is closest to your geographic location. **Important** don't forget to change `0xf1cfc50567acf36c55ba75540b7f1c3f1aaa986` to your Ethereum wallet's public address; otherwise, you are contributing to my wallet `:)`.
After the next `/`, gives a name to the mining machine. The next `/` is optional, you can provide your email address for notifications and enabled the ability to update Nanopool's payout schedule, i.e. this is good to provide an email.

**(7) Monitor the Mining Operation**: You can observe the hashrate measured in MH/s (1,000,000 hashes per second). The following screen output shows a typical Claymore Miner's log report.

![Claymore Miner Output Window Readings]({{ site.baseurl }}images/ethereum-mining-on-windows-10/Claymore_Miner_readings.jpg)

From the illustrated output, Ethereum mining logs are prefixed with `ETH:`. We can see the miner is fetching jobs from `eth-us-east1.nanopool.org:9999` that we have setup in the miner script, which confirmed that we are joining the Nanopool mining. The observed `GPU0`, the only GTX 1070 on the PC, hashing at 30 MH/s. When the mining pool is lucky and win, the `SHARE FOUND` will be reported. The shared computation effort will be awarded relative to the overall pool contribution to the winning Block!

**(8) Keep Cool and Pay Electricity Bill**: We need to understand how to keep our mining profitable by using a Ethereum calculator to estimate earnings. Here is one calculator by inputing the hashrate, power consumption and power cost per kiloWatt to estimate the profit [https://www.cryptocompare.com/mining/calculator/eth](https://www.cryptocompare.com/mining/calculator/eth)

For example, GTX 1070 hashrate is 30 MH/s, with 110 Watt power draw and average electricity cost of $0.12 KW/h.

![Ethereum Calculator Sample]({{ site.baseurl }}images/ethereum-mining-on-windows-10/Ethereum_Calculator_Sample_20170917.jpg)

*Figure. Screen Capture of Ethereum profit calcuation on `17 Sep, 2017`, where 1 ETH is traded at $263.89 USD*

The estimated dollar earning is affected by the current Ethereum trading price. It is easier to measure by ETHs that have been mined.

**(9) Repeat (6)-(8)**: Visit Nanpool and search for the Ethereum public address. It will display the mining statistics.

**(10) Increase Mining Operation**: If one's mining appetite grows, then it is time to learn how to build an [Ethereum Mining Rig](https://www.youtube.com/watch?v=mYgd33zaNc8). This video introduces how to build a 6x GTX 1070 GPUs mining rig has a hashrate of 180 MH/s, please have a look. Another article should be written on how to build this dedicated hardware.

{% include youtubePlayer.html id="mYgd33zaNc8" %}


Happy Ethereum mining!

### Donations

ETH: 0xf1cfc50567acf36c55ba75540b7f1c3f1aaa986

BTC: 1ogLdBTrLBLxPb27JAiMVUieXxxQ428Jg

SIA: 720bfb6473361e94376634ebbbc64ebc7932f4f4b3e5f2f6556e1140216fae440990d9dc9105
