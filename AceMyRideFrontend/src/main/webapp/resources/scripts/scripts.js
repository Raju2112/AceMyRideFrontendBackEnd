

function initMap() {
        var uluru = {lat: 28.497296, lng: 77.093714};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 15,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }

    function loadVerticalMenu(){
      verticalMenuItems.forEach(function(item){
        $('.vertical-menu ul').append('<li data-target="'+item.target+'">'+item.value+'</li>')
      });
    }
    function changeActiveItem(item){
      $('.v-active').removeClass('v-active');
      $('[data-target='+item+']').addClass('v-active');
    }
    $(document).ready(function(){
      loadVerticalMenu();
      changeActiveItem(defaultVerticalMenuItem);
      $('.vertical-menu ul li').click(function(event) {
        var target=$(event.target).attr('data-target');
        changeActiveItem(target);
      });
    });
