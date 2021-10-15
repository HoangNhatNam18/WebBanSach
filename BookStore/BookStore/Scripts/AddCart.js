$(document).ready(function () {
    $('.btnAddToCart').on('click', function (e) {
        e.preventDefault();
        var id = $(this).data('id');
        $.confirm({
            title: 'Thông báo',
            content: 'Bạn muốn thêm sản phẩm này không?',
            buttons: {
                'OK': function () {
                    $.ajax({
                        url: '/Cart/AddBookToCart',
                        type: 'Post',
                        data: { id: id, quantity: 1 },
                        dataType: 'json',
                        success: function (mes) {
                            if (mes.status == "1") {
                                $.confirm({
                                    title: 'Thêm thành công',
                                    content: 'Bạn muốn xem giỏ hàng không?',
                                    buttons: {
                                        'OK': function () {
                                            location.href = '/Cart/Index';
                                        },
                                        'Hủy': {
                                            text: 'Hủy',
                                            btnClass: 'btn-danger',
                                            keys: ['enter', 'shift'],
                                            action: function () {

                                            }
                                        }
                                    }
                                });
                            }
                            else {
                                $.alert({
                                    title: 'Rất tiếc',
                                    content: 'Sản phẩm trong kho không đủ !'
                                });
                                return;
                            }
                        }
                    });
                },
                'Hủy': {
                    text: 'Hủy',
                    btnClass: 'btn-danger',
                    keys: ['enter', 'shift'],
                    action: function () {

                    }
                }
            }
        });
        

    });

    $('.btnAddBooks').on('click', function (e) {
        e.preventDefault();
        var id = $(this).data('id');
        var quantity = $('#txtQuantity').val();
        $.confirm({
            title: 'Thông báo',
            content: 'Bạn muốn thêm sản phẩm này không?',
            buttons: {
                'OK': function () {
                    $.ajax({
                        url: '/Cart/AddBookToCart',
                        type: 'Post',
                        data: { id: id, quantity: quantity },
                        dataType: 'json',
                        success: function (mes) {
                            if (mes.status == "1") {
                                $.confirm({
                                    title: 'Thêm thành công',
                                    content: 'Bạn muốn xem giỏ hàng không?',
                                    buttons: {
                                        'OK': function () {
                                            location.href = '/Cart/Index';
                                        },
                                        'Hủy': {
                                            text: 'Hủy',
                                            btnClass: 'btn-danger',
                                            keys: ['enter', 'shift'],
                                            action: function () {

                                            }
                                        }
                                    }
                                });
                            }
                            else {
                                $.alert({
                                    title: 'Rất tiếc',
                                    content: 'Sản phẩm trong kho không đủ !'
                                });
                                return;
                            }
                        }
                    });
                },
                'Hủy': {
                    text: 'Hủy',
                    btnClass: 'btn-danger',
                    keys: ['enter', 'shift'],
                    action: function () {

                    }
                }
            }
        });

       

    });
    
});