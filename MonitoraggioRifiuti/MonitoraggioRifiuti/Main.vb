

Public Class Main

    Private Sub Esci_Click(sender As Object, e As EventArgs) Handles Esci.Click
        Application.Exit()
    End Sub

    Private Sub OpenDash_Click(sender As Object, e As EventArgs) Handles OpenDash.Click
        'Dim GestioneRifiuti As New frmGestione
        'Cursor = Cursors.AppStarting
        Me.Visible = False
        'Hide()
        frmGestione.Visible = True
    End Sub

    Private Sub OpenRiep_Click(sender As Object, e As EventArgs) Handles OpenRiep.Click
        'Dim FrmRiep As New RiepilogoGenerale
        Me.Visible = False
        'Hide()
        RiepilogoGenerale.Show()
    End Sub



    Private Sub Main_Shown(sender As Object, e As EventArgs) Handles MyBase.Shown
        Login.Hide()
    End Sub


End Class