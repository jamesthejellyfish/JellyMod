-- thanks to @aigiz010 for the translation!
local tarot_localization = {
    c_empress_rev = {
        name = "Перевернутая Императрица",
            text = {
               "Улучшает{C:attention}#1#",
               "выбранные карты до:",
               "{C:attention}#2#",
   },
   },
   c_star_rev = {
        name = "Перевернутая Звезда",
            text = {
               "Преобразует до",
               "{C:attention}#1#{} выбранных карт из {V:1}#2#{}",
               "в случайные масти, кроме: {V:1}#2#{}",
   },
   },
   c_moon_rev = {
        name = "Перевернутая Луна",
            text = {
               "Преобразует до",
               "{C:attention}#1#{} выбранных карт из {V:1}#2#{}",
               "в случайные масти, кроме: {V:1}#2#{}",
   },
   },
   c_sun_rev = {
        name = "Перевернутое Солнце",
            text = {
               "Преобразует до",
               "{C:attention}#1#{} выбранных карт из {V:1}#2#{}",
               "в случайные масти, кроме: {V:1}#2#{}",
   },
   },
   c_world_rev = {
        name = "Перевернутый Мир",
            text = {
               "Преобразует до",
               "{C:attention}#1#{} выбранных карт из {V:1}#2#{}",
               "в случайные масти, кроме: {V:1}#2#{}",
   },
   },
   c_judgement_rev = {
        name = "Перевернутый Суд",
            text = {
               "Заменяет случайного {C:attention}джокера{}",
               "на джокер {C:green}равной{} или {C:red}большей{} редкости",
               "{C:inactive}(сохраняет оригинальное издание)",
   },
   },
   c_death_rev = {
        name = "Перевернутая Смерть",
            text = {
               "Выберите {C:attention}#1#{} карты,",
               "{C:attention}улучшения{},  {C:attention}печати{}, и {C:attention}выпуски{}",
               "будут скопированы с {C:attention}левой{} карты в {C:attention}правую{}",
               "{C:inactive}(Карты можно двигать)",
   },
   },
   c_wheel_of_fortune_rev = {
        name = "Перевернутое Колесо Фортуны",
            text = {
               "Шанс {C:green}#1# из #2#{} добавить",
               "{C:dark_edition}фольговый{}, {C:dark_edition}голографический{}, или",
               "{C:dark_edition}полихромный{} выпуск",
               "к выбранной карте",
   },
   },
   c_heirophant_rev = {
        name = "Перевернутый Иерофант",
            text = {
               "Улучшает {C:attention}#1#",
               "выбранные карты до:",
               "{C:attention}#2#",
   },
   },
   c_fool_rev = {
        name = "Перевернутый Дурак",
            text = {
               "Шанс {C:green}#2# из #3#{} ничего не сделать.",
               "В противном случае, создает {C:dark_edition}негативную{} копию",
               "карты {C:tarot}таро{} или {C:planet}планеты{}",
               "использованную в этой партии",
               "{s:0.8,C:tarot}За исключением Перевернутого Дурака{s:0.8}",
   },
   },
   c_high_priestess_rev = {
        name = "Перевернутая Верховная Жрица",
            text = {
               "{C:green}Улучшает{} {C:attention}#1#",
               "случайные покерные руки,",
               "но {C:red}понижает{} {C:attention}#2#{}",
               "{C:inactive}(мин. ур. 1){}",
   },
   },
   c_chariot_rev = {
        name = "Перевернутая Колесница",
            text = {
               "Улучшает {C:attention}#1#{} выбранную",
               "карту до:",
               "{C:attention}#2#",
   },
   },
   c_lovers_rev = {
        name = "Перевернутые Влюбленные",
            text = {
               "Улучшает {C:attention}#1#{} выбранную",
               "карту до:",
               "{C:attention}#2#",
   },
   },
   c_hanged_man_rev = {
        name = "Перевернутый Висельник",
            text = {
               "Добавляет {C:attention}#1#{}",
               "случайные карты в вашу руку",
               "{C:inactive}(могут быть улучшенными)"
   },
   },
   c_strength_rev = {
        name = "Перевернутая Сила",
            text = {
               "Уменьшает достоинство",
               "до {C:attention}#1#{} выбранных",
               "карт на {C:attention}1",
   },
   },
   c_hermit_rev = {
        name = "Перевернутый Отшельник",
            text = {
               "Делит деньги пополам",
               "и дает случайный {C:attention}тег{}",
               "{C:inactive}(макс. {C:money}$#1#{C:inactive})",
   },
   },
   c_devil_rev = {
        name = "Перевернутый Дьявол",
            text = {
               "Улучшает {C:attention}#1#{} выбранную",
               "карту до:",
               "{C:attention}#2#",
   },
   },
   c_magician_rev = {
        name = "Перевернутый Волшебник",
            text = {
               "Улучшает {C:attention}#1#{} выбранную",
               "карту до:",
               "{C:attention}#2#",
   },
   },
   c_emperor_rev = {
        name = "Перевернутый Император",
            text = {
               "Использует до {C:attention}#1#",
               "случайных карт {C:tarot}таро{}",
               "{C:inactive}(выбирает случайные карты в руке)",
   },
   },
   c_temperance_rev = {
        name = "Перевернутая Умеренность",
            text = {
               "Дает {C:money}$#1#{}",
               "за каждую {C:attention}расходную{} карту",
               "которую вы держите {C:inactive}(макс. {C:money}$#2#{C:inactive})",
               "{C:inactive}(сейчас {C:money}$#3#{C:inactive})",
   },
   },
   c_tower_rev = {
        name = "Перевернутая Башня",
            text = {
               "Улучшает {C:attention}#1#{} выбранную",
               "карту до:",
               "{C:attention}#2#",
   },
   },
   c_justice_rev = {
        name = "Перевернутое Правосудие",
            text = {
               "Улучшает {C:attention}#1#{} выбранную",
               "карту до:",
               "{C:attention}#2#",
   },
   },
}

G.localization.misc.v_dictionary.a_xchips = "X#1# Chips"

return tarot_localization