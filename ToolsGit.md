Инструменты Git

1. Найдите полный хеш и комментарий коммита, хеш которого начинается на aefea
	commit aefead2207ef7e2aa5dc81a34aedf0cad4c32545
	Update CHANGELOG.md
	использовал команду - $ git show
	
2. Какому тегу соответствует коммит 85024d3
	tag: v0.12.23
	использовал команду - $ git show
	
3. Сколько родителей у коммита b8d720? Напишите их хеши.
	два родителя:  56cd7859e0 9ea88f22fc
	использовал команду - $ git show
	
4. Перечислите хеши и комментарии всех коммитов, которые были сделаны между тегами v0.12.23 и v0.12.24.
	33ff1c03bb960b332be3af2e333462dde88b279e (tag: v0.12.24) v0.12.24
	b14b74c4939dcab573326f4e3ee2a62e23e12f89 [Website] vmc provider links
	3f235065b9347a758efadc92295b540ee0a5e26e Update CHANGELOG.md
	6ae64e247b332925b872447e9ce869657281c2bf registry: Fix panic when server is unreachable
	5c619ca1baf2e21a155fcdb4c264cc9e24a2a353 website: Remove links to the getting started guide's old location
	06275647e2b53d97d4f0a19a0fec11f6d69820b5 Update CHANGELOG.md
	d5f9411f5108260320064349b757f55c09bc4b80 command: Fix bug when using terraform login on Windows
	4b6d06cc5dcb78af637bbb19c198faff37a066ed Update CHANGELOG.md
	dd01a35078f040ca984cdd349f18d0b67e486c35 Update CHANGELOG.md
	225466bc3e5f35baa5d07197bbc079345b77525e Cleanup after v0.12.23 release
	85024d3100126de36331c6982bfaac02cdab9e76 (tag: v0.12.23) v0.12.23
	использовал команду - $ git log v0.12.22..v0.12.24 --oneline
	
5. Найдите коммит, в котором была создана функция func providerSource, 
   её определение в коде выглядит так: func providerSource(...)
	8c928e83589d90a031f811fae52a81be7153e82f
	использовал команду - $ git log -S
	
6. Найдите все коммиты, в которых была изменена функция globalPluginDirs
	65c4ba7363 Remove terraform binary
	125eb51dc4 Remove accidentally-committed binary
	22c121df86 Bump compatibility version to 1.3.0 for terraform core release (#30988)
	7c7e5d8f0a Don't show data while input if sensitive
	35a058fb3d main: configure credentials from the CLI config file
	c0b1761096 prevent log output during init
	8364383c35 Push plugin discovery down into command package
	использовал команду - $ git log -S

7. Кто автор функции synchronizedWriters
	Author: Martin Atkins <mart@degeneration.co.uk>
	использовал команду - $ git log -S
	посмотрел хронологически первый коммит, где была объявлена данная функция.