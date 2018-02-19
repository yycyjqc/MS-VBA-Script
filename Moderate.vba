'Line 89 might cause an issue: "Run-time error'11'. Division by zero."
'Because the value of an expression being used as a divisor is ZERO.

Sub Moderate()

Dim DateMinOpen As Variant
Dim DateMaxClose As Variant
Dim i As Double
Dim x As Double
Dim j As Integer
Dim starting_ws As Worksheet
Set starting_ws = ActiveSheet

WS_count = ActiveWorkbook.Worksheets.Count

For j=1 to WS_count

ThisWorkbook.Worksheets(j).Activate

    Columns("I:Q").Select
    Selection.Clear

    Cells(1, 9).Value = "Ticker"
    Cells(1, 10).Value = "Yearly Change"
    Cells(1, 11).Value = "Percent Change"
    Cells(1, 12).Value = "Total Stock Volume"

    x = 2
    i = 2

    Cells(x, 9).Value = Cells(x, 1).Value

    DateMinOpen = Cells(i, 3).Value

    LastRow = Cells(Rows.Count, 1).End(xlUp).Row
    For i = 2 To LastRow
    If Cells(i, 1).Value = Cells(x, 9).Value Then

        TotalV = TotalV + Cells(i, 7).Value
        DateMaxClose = Cells(i, 6).Value

     Else

    Cells(x, 10).Value = DateMaxClose - DateMinOpen

            If DateMaxClose <= 0 Then

                    Cells(x, 11).Value = 0

                    Else

                    Cells(x, 11).Value = (DateMaxClose / DateMinOpen) - 1

            End If

                    Cells(x, 11).Style = "Percent"

            If Cells(x, 10).Value >= 0 Then

                Cells(x, 10).Interior.ColorIndex = 4

                    Else

                Cells(x, 10).Interior.ColorIndex = 3

            End If

    Cells(x, 12).Value = TotalV

    DateMinOpen = Cells(i, 3).Value

    TotalV = Cells(i, 7).Value

    x = x + 1
    Cells(x, 9).Value = Cells(i, 1).Value

    End If

Next i

Cells(x, 10).Value = DateMaxClose - DateMinOpen

                If DateMaxClose <= 0 Then

                    Cells(x, 11).Value = 0

                    Else

                    Cells(x, 11).Value = (DateMaxClose / DateMinOpen) - 1

                End If

                    Cells(x, 11).Style = "Percent"

            If Cells(x, 10).Value >= 0 Then

                Cells(x, 10).Interior.ColorIndex = 4

                    Else

                Cells(x, 10).Interior.ColorIndex = 3

            End If

Cells(x, 12).Value = TotalV
Columns("I:Q").EntireColumn.AutoFit
Cells(1, 1).Select

Next j

End Sub
