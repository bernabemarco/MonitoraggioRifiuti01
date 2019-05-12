Public Class Main


    Private Sub Esci_Click(sender As Object, e As EventArgs) Handles Esci.Click
        Application.Exit()
    End Sub

    Private Sub OpenDash_Click(sender As Object, e As EventArgs) Handles OpenDash.Click
        Dim GestioneRifiuti As New frmGestione

        GestioneRifiuti.Show()
    End Sub

    Private Sub OpenRiep_Click(sender As Object, e As EventArgs) Handles OpenRiep.Click
        Dim FrmRiep As New RiepilogoGenerale

        FrmRiep.Show()
    End Sub
End Class