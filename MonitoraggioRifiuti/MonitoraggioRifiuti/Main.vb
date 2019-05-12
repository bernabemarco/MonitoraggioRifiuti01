Public Class Main

    Dim tempo As Integer = 0
    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        tempo += 1
        ProgressBar1.Value = tempo

        Dim gr As Graphics = ProgressBar1.CreateGraphics
        Dim fnt As Font = New Font("courier new", 12, FontStyle.Bold)
        gr.DrawString(tempo.ToString & " %", fnt, Brushes.Black, 350, 5)
        gr.Dispose()

        If tempo > 99 Then Timer1.Enabled = False

    End Sub






    Private Sub Esci_Click(sender As Object, e As EventArgs) Handles Esci.Click
        Application.Exit()
    End Sub

    Private Sub OpenDash_Click(sender As Object, e As EventArgs) Handles OpenDash.Click
        Dim GestioneRifiuti As New frmGestione

        With Timer1
            .Enabled = True
            .Interval = 25
        End With

        With ProgressBar1
            .Minimum = 0
            .Maximum = 1000
            .Value = 0
            .Style = ProgressBarStyle.Continuous
        End With


        'Me.Cursor = Cursors.AppStarting


        GestioneRifiuti.Show()
    End Sub

    Private Sub OpenRiep_Click(sender As Object, e As EventArgs) Handles OpenRiep.Click
        Dim FrmRiep As New RiepilogoGenerale

        FrmRiep.Show()
    End Sub


End Class