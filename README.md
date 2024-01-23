
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
Use this project as a starting point for any web app you are thinking of building. It has the following things out of the box:

1. Simple GUI based mechanism to define, develop, debug and maintain web routes.
2. A file server component that server on /assets. It implements ETag.
3. (coming) File upload capability
4. Htmlbuilder where you can programatically generate complex nesting, including inline styles. There is inbuilt support for VueJS (browser). You can generate html snippets very easily as follows:
```
function summarySection: string;
begin
    with THtmlDiv.Create do begin
        try
            h1('Overview);
            div_('This is a test section);
            h2('Section 1');
            // Shows off method chaining
            div_('This is sub section for this topic')
                .class('ui blue text')
                .setAttr('')
                .div_('This is a nested div');

            Result := html(); // Generates the Html code
        finally
            free;
        end;
    end;
end;
```
6. A powerful wrapper for SQLite where you can define a complex schema in a Pascal unit from which we can programatically generate the SQL code necessary to create and initialize the database. The wrapper also allows you to manage multiple database files (with something like:

``` dbModule('thisdata.db').put(_tableName, _rowID, _field, value) ```

which updates a field in a table.

This project showcases wonderful the developer experience of building a complex application in FPC/Lazarus and to highlight its cross-platform capabilities. You can compile the code on Windows, Mac and Linux without having to tweak it too much. The final binary is blazingly fast and can run efficently on a single-core, 1GB RAM virtual machine. 

As a language, Object Pascal compares favourably with other languages in terms of how easy it is to get started with it. Where it shines, afaik, is in the inherent syntax structure that offers many ways to organize your code and navigate through different sections. It is orders of magnitude easier to figure out the logic in a large Object Pascal project (Lazarus, Delphi) than any others that I've delved into. 

This project has only been possible because of the dedication and persistance of the FPC/Lazarus team, the amazing micro-services framework for FPC [Brook Tardigrade](https://github.com/risoflora/brookframework), the cryptography library [Rhl](https://github.com/maciejkaczkowski/rhl).
