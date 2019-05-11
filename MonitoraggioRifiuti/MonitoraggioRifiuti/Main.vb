Public Class Main
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim GestioneRifiuti As New Form1

        GestioneRifiuti.Show()
    End Sub

    Private Sub Esci_Click(sender As Object, e As EventArgs) Handles Esci.Click
        Application.Exit()
    End Sub
End Class