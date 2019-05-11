Public Class Form1
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'TODO: questa riga di codice carica i dati nella tabella 'SicuraDataSet.Codici_CER'. È possibile spostarla o rimuoverla se necessario.
        Me.Codici_CERTableAdapter.Fill(Me.SicuraDataSet.Codici_CER)
        'TODO: questa riga di codice carica i dati nella tabella 'SicuraDataSet.EXTRATESTERIFIUTI'. È possibile spostarla o rimuoverla se necessario.
        Me.EXTRATESTERIFIUTITableAdapter.FillExtraTesteRifiuti(Me.SicuraDataSet.EXTRATESTERIFIUTI)
        'TODO: questa riga di codice carica i dati nella tabella 'SicuraDataSet.Biri_MonitoraggioRifiuti'. È possibile spostarla o rimuoverla se necessario.
        Me.Biri_MonitoraggioRifiutiTableAdapter.FillMonitoraggio(Me.SicuraDataSet.Biri_MonitoraggioRifiuti)

    End Sub

    Private Sub Biri_MonitoraggioRifiutiBindingNavigatorSaveItem_Click(sender As Object, e As EventArgs)
        Me.Validate()
        Me.BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource.EndEdit()
        Me.TableAdapterManager.UpdateAll(Me.SicuraDataSet)
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim FrmDett As New DettaglioDoc

        FrmDett.stringfilter = Biri_MonitoraggioRifiutiDataGridView.CurrentRow.Cells(0).Value.ToString()
        FrmDett.Show()


    End Sub
End Class
