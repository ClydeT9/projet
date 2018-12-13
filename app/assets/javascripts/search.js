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
                return "<div id='searchflex'> <div id='bloc1'></div>" + "<div id='bloc2'><h6><span class='s-1'>" + element.title + " </span></h6> " + "<span class='s-2'>" + element.slogan + "</span> </div></div>";
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