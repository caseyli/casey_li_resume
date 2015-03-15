window.windowScroll = ->
  pixelsDown = $(window).scrollTop()
  $(".scroll-position").html pixelsDown

  windowHeight = $(window).height()
  percentage = pixelsDown / (scrollBoxHeight - windowHeight) * 100

  $("#scroll-bar-top .scroll-bar-horizontal").css("width", percentage + "%")
  $("#scroll-bar-bottom .scroll-bar-horizontal").css("width", percentage + "%")

  $("#scroll-bar-left .scroll-bar-vertical").css("height", percentage + "%")

  percentageOpp = 100 - percentage
  $("#scroll-bar-right .scroll-bar-vertical").css("height", percentageOpp + "%")

  scrollDownPixels = pixelsDown
  if scrollDownPixels > window.heightOfScrollingContent
    scrollDownPixels = window.heightOfScrollingContent
  
  $(".scroll-down").css("top", "-" + scrollDownPixels + "px")
  $(".menu-items").css("top", "-" + scrollDownPixels + "px")

  if pixelsDown > heightOfScrollingContent
    leftPercentage = (pixelsDown - window.heightOfScrollingContent) / 
                          (window.scrollBoxHeight - window.heightOfScrollingContent - windowHeight)

    if leftPercentage > 1
      leftPercentage = 1
    menuItemsPixelsLeft = leftPercentage * 
                          (window.widthOfMenuItems - window.widthOfOneMenuItem);
    $(".menu-items").css("left", "-" + menuItemsPixelsLeft + "px")
  else
    $(".menu-items").css("left", "0px")

$ ->
  if $("#landing").length > 0
    window.scrollBoxHeight = $(".scrollbox").height()
    window.widthOfMenuItems = $(".menu-items").width()
    window.widthOfOneMenuItem = $(".menu-item").width() + 60
    window.heightOfScrollingContent = $("#scrolling-content").height()

    $(window).scroll windowScroll

