function CalcSum() {
            var total_sum = 0;
            $("#tabelList .txtAmount").each(function () {
                var val = $(this).val();
                if ($.isNumeric(val)) {
                    total_sum += parseFloat(val);
                }
            });
            $("#total").html(total_sum);
            $("#TotalMoney").val(total_sum);
        }
　　　　　///數量列任何一個文件框數據變化事件
        $("#tabelList").on(‘input‘, ‘.txtQuantity‘, function () {
            var self = $(this);
            var tr = self.closest("tr");

            var quantity = self.val();
            var Price = tr.find(".txtPrice").val();

            var amount = 0
            if ($.isNumeric(quantity) && $.isNumeric(Price)) {
                amount = quantity * Price;
            }
            tr.find(".txtAmount").val(amount);

            CalcSum();
        });
　　　　///價格列任何一個文件框變化事件
        $("#tabelList").on(‘input‘, ‘.txtPrice‘, function () {
            var self = $(this);
            var tr = self.closest("tr");

            var quantity = tr.find(".txtQuantity").val();
            var Price = self.val();

            var amount = 0
            if ($.isNumeric(quantity) && $.isNumeric(Price)) {
                amount = quantity * Price;
            }
            tr.find(".txtAmount").val(amount);
            CalcSum();
        });
 　　　　///刪除一行
        function deleteRow(obj) {
            var index = obj.parentNode.rowIndex;
            var table = document.getElementById("tabelList");
            table.deleteRow(index);
            CalcSum();
        }
        ///添加一行
        function AddList() {
            var html = ‘<tr>‘ +
                        ‘<td>‘ +
                        ‘<input class="text-center form-control" style="border:none" type="text" name="DetailedListVal" />‘ +
                        ‘</td>‘ +
                        ‘<td>‘ +
                        ‘<input class="text-center form-control" style="border:none" type="text" name="DetailedListVal"/>‘ +
                        ‘</td>‘ +
                        ‘<td>‘ +
                        ‘<input class="text-center form-control" style="border:none" type="text" name="DetailedListVal" />‘ +
                        ‘</td>‘ +
                        ‘<td>‘ +
                        ‘<input class="text-center form-control" style="border:none" type="text" name="DetailedListVal" />‘ +
                        ‘</td>‘ +
                        ‘<td>‘ +
                        ‘<input class="text-center form-control txtQuantity" style="border:none" type="text" name="DetailedListVal" />‘ +
                        ‘</td>‘ +
                        ‘<td>‘ +
                        ‘<input class="text-center form-control txtPrice" style="border:none" type="text" name="DetailedListVal"  />‘ +
                        ‘</td>‘ +
                        ‘<td>‘ +
                        ‘<input class="text-center form-control txtAmount" style="border:none" type="text" name="DetailedListVal" />‘ +
                        ‘</td>‘ +
                        ‘<td  onclick="deleteRow(this)"><button type="button" class="btn btn-danger waves-effect">刪除</button></td>‘+
                        ‘</tr>‘;
            $("#tabelList").append(html);
        };
        
        
