Public Class Utility
    Private Sub Codici_CERBindingNavigatorSaveItem_Click(sender As Object, e As EventArgs) Handles Codici_CERBindingNavigatorSaveItem.Click
        Me.Validate()
        Me.Codici_CERBindingSource.EndEdit()
        Me.TableAdapterManager.UpdateAll(Me.SicuraDataSet)

    End Sub

    Private Sub Utility_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'TODO: questa riga di codice carica i dati nella tabella 'SicuraDataSet.Codici_CER'. È possibile spostarla o rimuoverla se necessario.
        Me.Codici_CERTableAdapter.FillCodiciCer(Me.SicuraDataSet.Codici_CER)

    End Sub
End Class