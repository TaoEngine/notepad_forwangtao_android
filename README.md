# NotePad for WangTao(Android Platform) / 汪涛的记事本（安卓版）

A NotePad application for me. I really like it, and I hope that those of you who have the chance to see it will like it too!\
写给我自己的记事本APP，我很喜欢它，希望有缘见到它的你也能喜欢上它哦！

(WIP) \
(目前还在写)

The original text is in Chinese, translated by ChatGLM.\
我使用ChatGLM将我的话翻译为英文了

## What can it do 它能干什么
I am currently a college student at a regular university, with a strong interest in technology and DIY. If I can balance my studies and daily life, I might become a small DIY blogger in that niche.\
我目前是一位普通学校的大学生，对科技和DIY有着浓厚的兴趣。如果可以顾及学业和生活的话我可能会做一个DIY区的小博主吧。

I enjoy a paperless learning style that is rich in technology. The convenience of modifying and browsing notes without paper leads me to always have my tablet ready for studying.\
我喜欢富有科技感的无纸化学习方式，无纸化记笔记的方便修改、方便翻阅的特点使我每次学习都备上平板。

I've tried many note-taking apps, including those for handwriting and typing (Markdown, rich text), but I've only dabbled in them and never really stuck with any. Instead, I use the iPad Notes app the most.\
我用过好多记笔记软件，有手写的，有打字(markdown，富文本)的，但是我用笔记软件都是浅尝则止，反而用的最多的是iPad备忘录。

The operational logic and note-taking feel of the iPad Notes app align very well with my views on note-taking software, and I have become quite proficient with it. However, there are still some issues with this notes, so I spent a few months learning Flutter and have decided to make my own notepad app!\
iPad备忘录的操作逻辑、笔记手感之类的非常符合我对笔记软件的看法，我如今已经非常熟练它了。但是这个备忘录还是有些问题，所以我花了几个月学习了Flutter，决定要做一个属于自己的记事本了！

- It is a handwriting notepad because I enjoy the feel of writing by hand.
    - Handwriting is faster than typing and allows for more freedom in formatting.
    - Handwritten notes are more convenient to browse than video or voice recorded lectures.
    - Handwritten notes also won't end up like PPT photos that you never look at again 😅.
- 它是一款手写记事本，因为我喜欢手写的感觉
    - 手写比码字更快，格式更自由
    - 手写比视频语音录课更方便浏览
    - 手写笔记还不会像给PPT拍照那样从来不会看哈😅

- Its logic is similar to the iPad Notes, where you keep writing notes downward ⬇️, because I'm used to using the Notes.
    - This kind of endless downward note-taking is like a roll of paper, making it very convenient to find and write on a specific page.
    - I've always admired the principle of the Turing machine, which performs create, read, update, and delete operations on a single tape, gradually refining the essence of information over time.
    - One unique aspect of the iPad Notes compared to other note-taking apps is that it doesn't allow you to zoom in on the note canvas. This is an excellent solution that ensures the entire note remains well-readable.
- 它的逻辑类似于iPad备忘录那样一直向下⬇️记笔记，因为我用备忘录习惯了
    - 这种无限向下笔记就和卷纸一样，想记到某个页面都非常方便
    - 图灵机的原理我一直很佩服，在一张纸带上进行增删改查，日积月累就能在纸带上提炼出信息的本质
    - iPad的备忘录还有个与其他笔记软件不一样的地方就是不能对笔记画布进行放大，这是一种使全篇笔记都具有良好可读性的非常棒的方案

- It has a feature for creating memory gaps, but it's not as complex to operate as Anki or SuperMemo, because I believe that memory happens in the moment, and focusing too much on the format and appearance of the cards is a bit of a waste of time.
    - The concept of creating memory gaps is used by many apps for knowledge base memorization, but they require you to input various tags in advance to insert into what you want to remember, which isn't very intuitive.
    - Anki and SuperMemo are like that too; although making flashcards does indeed enhance memory, the process of creating the cards is just too cumbersome🤔.
    - I used to use Anki, and although it would remind me how many cards I had to review each day, sometimes I would forget to open Anki to check today's tasks, so over time, I gave up on Anki and on using apps for memorization.
    - So it includes a notification system that seamlessly integrates with the memory gap feature; its gap preparation simply requires circling the area on the screen.
- 它有挖空进行记忆的功能，但又不像Anki、SuperMemo那样操作复杂，因为我觉得记忆就在当下，注重卡片的格式和外观还是有些浪费时间了
    - 挖空记忆被很多APP应用于知识库记忆上面，但是它们需要提前输入各种标签从而插入到要记忆的东西上，不直观
    - Anki和SuperMemo也是这样的，虽然制作卡片确实能促进记忆，但奈何制作卡片的过程实在繁琐了啊🤔
    - 我以前用过Anki，虽然Anki会提醒我今天有多少卡片要看，但有时候就是会忘记打开Anki查看今天的任务，因此久而久之就放弃了Anki，放弃了APP记忆
    - 所以它内置了一个通知系统，专门和和挖空记忆功能无缝对接；它的挖空预准备只需要在屏幕上圈一下就行了

- It has the ability to recognize handwriting, because my class notes are always messy.
    - (WIP...)
- 它有字迹识别的能力，因为我上课记笔记总是乱的
    - (在想...)

- It also has a dedicated class mode.
    - The principle is similar to the "Kiosk" mode on the Android platform, which locks a single app on the screen and prevents any notifications, sounds, or opening of other apps (I discovered this amazing Android feature while using GeoGebra!).
    - In this mode, tools like the Pomodoro technique and focus mode can truly be effective, because previously, when I used the Pomodoro timer, I would get too carried away playing with my phone or tablet during breaks, completely ignoring the timer 🤣.
- 它还有一个专心上课模式
    - 原理就是安卓平台的"Kiosk"模式，能将一个应用固定在屏幕上，而且不能接收通知，不能发出响声，还不能打开其他应用（我在使用GeoGebra的时候发现到了这个神奇的安卓功能！）
    - 在这种模式下，像番茄钟、专注模式才能真正起到作用，毕竟我之前用番茄钟的时候，歇一会玩起手机平板来太凶了，直接无视番茄钟🤣

## Would you like to create your own notepad as well? / 你也想整一个属于自己的记事本？

I've always wanted to create my own notepad software. At first, it was because the Apple Notes app would overheat and then crash after running for a long time. Later, I discovered some areas in the Apple Notes app that I believe need improvement. I spent a long time creating a mind map to organize my ideal notepad (later renamed, it serves as a list of features that I want to implement in the notepad I aim to create).\
我一直想要制作一个属于自己的记事本软件，一开始是因为苹果备忘录在在长时间运行的情况下会发热，然后闪退。后来又发现苹果备忘录有一些我认为需要提升的地方。我花了很长时间做了这样一个思维导图来整理我心目中的记事本（后来改了名字，作为我想实现的记事本需要实现的地方）

![funcshow](funcshow.jpg)

Later on, as my studies progressed, I also found time in my daily life to watch short videos. I saw many developers releasing apps with tens of thousands of likes, and my goals started to shift. I wanted to write a note-taking app that would make a splash across the internet. I began to pay attention to many note-taking apps, hoping to learn what I could do that these popular apps couldn't. But the more I looked, the more pressure I felt. It seemed that most note-taking apps had already implemented the features I wanted, and they were mature products created by teams with user loyalty. It's unlikely that I would become popular just by writing a note-taking app.\
后来，随着学业的成长，我也在生活之余刷刷短视频，看到了好多开发者发布那些点赞好多万的APP，于是目标开始偏了，想写一个轰动全网的笔记APP，我开始关注好多笔记APP，想借此学习一下我能做到哪些大众笔记APP做不到的事情，但看的越多，我也就越有压力，大家的笔记本基本都把我想要的功能实现出来了，而且它们基本是团队做出的成熟产品，有用户粘性，不太可能通过写笔记APP来把自己带火吧

Why not write a notepad app for myself? So, I've returned to my true nature and decided to just write a notepad that I like (actually, there's a bit of a story behind the specific change of heart, but I'll talk about that later).\
为什么不能为自己写一款记事本APP呢？因此我还是回归本性，写一个自己喜欢的记事本就行了（其实具体改观的原因还是有点故事的，以后再说吧）

Because I am still in the process of writing it and have not yet implemented all the application features, if you want to try out this note-taking app, you can start by setting up the Flutter environment on your computer. Then, download my source code and run the following command in the root directory:\
因为我目前还在写，还没实现完整的应用功能，如果你想试试看这个笔记APP的话，可以先在你的电脑上搭建Flutter环境，然后将我的源码下下来并在根目录运行：
```bash
flutter build apk
```
After that, you will have your very own notepad!\
就能得到一个属于你自己的记事本啦！

Of course, if you have some experience with Flutter development, that would be even better. I've added a lot of comments to make it easier for you to modify the code (though my main purpose was to organize my own thoughts).\
当然你如果有一定Flutter开发的经验那就更好了，我做了非常多的注释方便你修改代码（但主要目的是为了整理我自己的思路）

I'm not very skilled at coding, so if you find any issues or have some suggestions, make sure to kick me a message! It's a personal small project, and I don't think it's necessary to create a group chat, so let's just make do with using issues for communication.\
我写代码比较菜，发现问题、有些意见记得踹我哈！个人小项目，感觉没创建群聊的意义吧，就将就一下使用issue好了

In the end, I want to say that having ideas is always good. What if they come true?\
最后我想说，有想法总是好的，万一它实现了呢？