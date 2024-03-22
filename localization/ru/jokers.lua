-- thanks to @aigiz010 for the translation!
local localization = {
    j_tarlton = {
         name = "Тарлтон",
             text = {
                "Копирует эффекты",
                "всех других {C:attention}Джокеров{}",
        },
    },
    j_pierrot = {
         name = "Пьеро",
             text = {
                "Позволяет выбрать и разыграть {C:attention}6{}",
                "карт вместо 5.",                 
        },
    },
    j_prosopagnosia = {
         name = "Прозопагнозия",
             text = {
                "{C:red}Ни-какие{} карты",
                "не считаются",
                "картами с {C:attention}лицом{}",
        },
    },
    j_double_vision = {
         name = "В глазах двоится",
             text = {
                "Все карты",
                "подсчитываются",
                "{C:attention}дважды.{}",
        },
    },
    j_scouter = {
         name = "Я ясновидящий",
             text = {
                "Показывает, сколько",
                "очков наберёт",
                "данная комбинация:",
                "{C:blue,E:1,S:0.8}#1#{}",
        },
    },
    j_special_snowflake = {
         name = "Особенная снежинка",
             text = {
                "Этот джокер дает {X:mult,C:white} X#1# {} множ.",
                "за каждую {C:attention}уникально улучшенную карту",
                "в полной колоде",
                "{C:inactive}(пр: {C:green}золотая, зол. с крас. печатью, стальная, и т.д.{}{C:inactive})",
                "{C:inactive}(сейчас {X:mult,C:white} X#2# {C:inactive} множ.)",
        },
    },
    j_collector = {
         name = "Коллектор",
             text = {
                "Этот джокер дает {X:mult,C:white} X#1# {} множ.",
                "за каждого {C:attention}не оригинального джокера,",
                "которых вы держите",
                "{C:inactive}(сейчас {X:mult,C:white} X#2# {C:inactive} множ.)",
        },
    },
    j_copycat = {
         name = "Подражатель",
             text = {
                "Копирует способность",
                "случайного {C:attention}джокера{},",
                "который у вас есть",
                "(сейчас {C:green}#1#{})",
        },
    },
    j_greener_pastures = {
         name = "Зеленое пастбище",
             text = {
                "При выборе блайнда создает случайного",
                "{C:dark_edition}негативного{} джокера, которого нельзя продать.",
                "Созданный джокер заменяется при выборе блайнда,",
                "но уничтожится, если продать основной джокер.",
        },
    },
    j_one_more = {
         name = "Еще разок!",
             text = {
                "Продайте эту карту, чтобы добавить",
                "свою предыдущую комбинацию к текущему счету",
                "(сейчас {C:blue,E:1,S:1}#1#{})",
        },
    },
    j_pessimist = {
         name = "Пессимист",
             text = {
                "Продажа этого джокера добавляет",
                "{C:dark_edition}негатив{} на случайного джокера.",
                "Навсегда {C:blue}-#1#{} руки.",
                "{C:inactive}({C:attention}Уничтожается{C:inactive} при выборе блайнда){}"
        },
    },
    j_lipographic_jokr = {
         name = "Липографический Джокер",
             text = {
                "Дает {C:mult}+#1#{} множ. за каждую",
                "сыгранную карту. Дает {C:mult}-#2#{} множ.",
                "за каждый {C:attention}пятый символ{}",
                "в названии сыгранной карты.",
        },
    },
    j_buckleswasher = {
         name = "Зероволог",
             text = {
                "Добавляет стоимость продажи",
                "всех {C:attention}джокеров{} во владении {C:red,E:1,S:0.3}справа{}",
                "от этой карты к множ.",
                "{C:inactive}(сейчас {C:mult}+#1#{C:inactive} множ.)",
        },
    },
    j_hatter = {
         name = "Безумный шляпник",
             text = {
                "{C:green,E:1,S:0.7}перетасовывает{} {C:attention}улучшения{},",
                "{C:attention}печати{}, и {C:attention}выпуски{}",
                "карт в сыгранной руке",
        },
    },
    j_safari = {
         name = "Сафари-джокер",
             text = {
                "{C:attention}Все карты{} считаются",
                "одной мастью",
        },
    },
    j_oops_1s = {
         name = "Упс! Все однёрки",
             text = {
                "Делит на 2 все {C:attention}перечисленные",
                "{C:green,E:1,S:1.1}вероятности",
                "{C:inactive}(напр.: {C:green}1 из 3{C:inactive} -> {C:green}1 из 6{C:inactive})",
        },
    },
    j_zeno = {
         name = "Джокер Зенона",
             text = {
                "Если вы используете 50% карт из всей колоды",
                "в раунде, то {C:attention}случайная{} карта",
                "в вашей колоде будет {C:red}уничтожена{}",
                "и будет создана {C:spectral}спектральная{} карта",
    
             },
    }
}

G.localization.misc.dictionary.k_no_you = "Reversed!"
G.localization.misc.dictionary.k_hatter = "CHANGE PLACES!"
G.localization.misc.dictionary.k_zeno = "Halfway!"



G.localization.misc['poker_hands']['Six of a Kind'] = 'Six of a Kind'
G.localization.misc['poker_hands']['Flush Six'] = 'Flush Six'
G.localization.misc['poker_hands']['Flusher House'] = 'Flusher House'
G.localization.misc['poker_hands']['Fuller House'] = 'Fuller House'
G.localization.misc['poker_hands']['Three Pair'] = 'Three Pair'

return localization