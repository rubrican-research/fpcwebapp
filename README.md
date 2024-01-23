
<img src="https://github.com/stanley643212/fpcwebapp/assets/33192595/5930b133-b41c-4948-9a6f-fd80f1655220" alt="drawing" width="120"/>

# Barebones Web Server in FPC/Lazarus
Building a full-featured webserver for an htmx based web application needs a manageable server codebase = Easy to setup, easy to read, easy to refactor with easy/quick database access. Object Pascal is overlooked by reviewers and webdevs. It is probably because there are not many tutorial videos that showcase the wide capbabilities of the language rather than a flaw in the technology.

## Requirements
[Lazarus IDE](https://www.lazarus-ide.org/)

Install the following packages in Lazarus in this order:
1. [Rhl](https://github.com/maciejkaczkowski/rhl)
2. [Brook Tardigrade](https://github.com/risoflora/brookframework). You will also need to install the dll/so for libsagui. Instructions are on their github page
3. [Sugar for FP/Lazarus](https://github.com/stanley643212/sugar). This gives you a lot of syntax sugar to quicky build html pages and serve.

Documentation is coming soon. 

# Objective
This project showcases wonderful the developer experience of building a complex application in FPC/Lazarus and to highlight its cross-platform capabilities. You can compile the code on Windows, Mac and Linux without having to tweak it too much. The final binary is blazingly fast and can run efficently on a single-core, 1GB RAM virtual machine. 

As a language, Object Pascal compares favourably with other languages in terms of how easy it is to get started with it. Where it shines, afaik, is in the inherent syntax structure that offers many ways to organize your code and navigate through different sections. It is orders of magnitude easier to figure out the logic in a large Object Pascal project (Lazarus, Delphi) than any others that I've delved into. 

This project has only been possible because of the dedication and persistance of the FPC/Lazarus team, the amazing micro-services framework for FPC [Brook Tardigrade](https://github.com/risoflora/brookframework), the cryptography library [Rhl](https://github.com/maciejkaczkowski/rhl).
