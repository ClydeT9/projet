document.addEventListener("turbolinks:load", function () {
    $input = $("[data-behavior='autocomplete']")

    var options = {
        url: function (phrase) {
            return "/search.json?q=" + phrase;
        },
        categories: [{
                listLocation: "softwares",
                // header: "<strong>Applications</strong>",
            }
            // ,
            // {
            //     listLocation: "categories",
            //     header: "<strong>Catégories</strong>",
            // }
        ],

        template: {
            type: "custom",
            method: function (value, element) {
                return "<div class='flex'><div class='w-1/6'><img class='imagesearch' src='" + element.logo_url + "'/> </div>" + "<div class='w-5/6'><h6>" + element.title + "</h6> " + "<span class='s-2'>" + element.slogan + "</span> </div></div>";
            }
        },
        list: {
            maxNumberOfElements: 6,
            showAnimation: {
                type: "normal", //normal|slide|fade
                time: 0,
                callback: function () {}
            },
            hideAnimation: {
                type: "normal", //normal|slide|fade
                time: 0,
                callback: function () {}
            },
            onShowListEvent: function () {

            },
            onHideListEvent: function () {

            },
            onChooseEvent: function () {
                var url = $input.getSelectedItemData().url
                $input.val("")
                Turbolinks.visit(url)
                $(".easy-autocomplete-container ul").hide()
            }
        }
    }
    $input.easyAutocomplete(options)
});