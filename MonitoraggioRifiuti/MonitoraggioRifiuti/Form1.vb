Public Class Form1
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'TODO: questa riga di codice carica i dati nella tabella 'SicuraDataSet.Monitoraggio'. È possibile spostarla o rimuoverla se necessario.
        Me.MonitoraggioTableAdapter.Fill(Me.SicuraDataSet.Monitoraggio)

    End Sub
End Class