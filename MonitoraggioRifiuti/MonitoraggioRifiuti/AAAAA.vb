Public Class AAAAA
    Private Sub Codici_CER1BindingNavigatorSaveItem_Click(sender As Object, e As EventArgs) Handles Codici_CER1BindingNavigatorSaveItem.Click
        Me.Validate()
        Me.Codici_CER1BindingSource.EndEdit()
        Me.TableAdapterManager.UpdateAll(Me.SicuraDataSet)

    End Sub

    Private Sub AAAAA_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'TODO: questa riga di codice carica i dati nella tabella 'SicuraDataSet.Codici_CER1'. È possibile spostarla o rimuoverla se necessario.
        Me.Codici_CER1TableAdapter.Fill(Me.SicuraDataSet.Codici_CER1)

    End Sub
End Class